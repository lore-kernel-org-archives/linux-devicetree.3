Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B138D3FE
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386990; cv=none; b=RxTLTdRQRj0bZ/Br61CnLnWS34dPRyYYoUPSIpA6oVj3hwNl+OUKna/coxnxtE6Y2oRsrhJCKPD0A14m9EZUhHCAFHKj585RIT/EVhUxg2louqI/wz+AX0SFfjn7H/ltw0UHEMcQlIBM8tByNEv2jZjXXN7XsGV9nR8rJ+XiPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386990; c=relaxed/simple;
	bh=HdVBOJaLH9+tElXaI37rhEAG+8TDso2hBOAXn/S58h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8qsT1ZeRdeJsbV+zbZqJ9vppxC4vzNAnyoJ4HoraQyAZqYQVIYbIdi+noAUkNVB58GB22RSxqdRJDPTAZLKZxjZ3QOZzBKNzOS6QitRKJLwbu+7gd1730X6rGtSfc0ov+tWOuM+sN8G/gNZBW9SZqtHN7IsphJwq9CiC/A7s5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paVTgpuj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paVTgpuj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5463262f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386987; x=1779991787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwRKMllRpAzGBdyZ/lJigiiPKVoHGY8aJQFT7Qv+hEs=;
        b=paVTgpujiJq6kF8r5IUu8lHMH9JfuX21v0zOGY572qc4qTeg4RahNRlRrmu6SLihPQ
         /m/u1Heh3lNYmxq4k/FBeiNGz39FOv7FEae+pk/0VDsY9bw4QVJMelbBN0QbryMg4F9e
         rWCoJr5rQXk6JTBAkLKqcaVs6RNUh4Dg7XrWn3AVlVAViEJRtd4lZAIBOgiom3RscaSr
         YbyjbchpzfMFjUaYi/o2SBwlHQq1gCrWslZO1EbBKYNmtLrxWd2yssMPBAxrv/FoUen9
         tG6uhLWJhSXfwhqMfcXN1IHhBBaoILwE6z5lic77mVkVk7sXDSCf0nlM35LSt4pFjozl
         Q1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386987; x=1779991787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwRKMllRpAzGBdyZ/lJigiiPKVoHGY8aJQFT7Qv+hEs=;
        b=kOw+IgTPPaFufI0mKDUOJqMURYMOsJ3FgO95r1D9Uh+pe5fUpSyow0ZXdBMv+Pjbs+
         trv/XOug6FNn6vzPRZvUyKJyS+V6FDQq3t4IHsQmPUcn2QOykvMSbGSuKX6/lDb5+fyA
         yuLljn6KiOiSRaJFp/EHmZFdm3SXVsFluI4XmJk6HM5EuW2DfIEegs36f7/EzIO26QVn
         HNUX/JxM2rB2dylLlqotuOpwnf6YXoU2VyRY8KN0O9CrBc28hzR1JvYMsDKN3PwaqWeD
         wD/RmDCK5Y47fhIFZgE+cWlp8efa9KgrAR+LZKyDz4dffVVzurXHW9MG1nI/CWt6X2oi
         MqYA==
X-Forwarded-Encrypted: i=1; AFNElJ+rD+hH/fcO9DbkmwCAMe84+JQbjXeZXTosJv76knbRd+4eyH0GbPgbahf6cOQstvtlOf9MabjM0Mrk@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGqIVj5ECcZ3WOn9YxFv/MgsTRioKHHpp9n4ujW7BNqQINXXl
	/lOM6NikUPX8BQDGwKH5YyTFF4UZHs04ub8edt7BHunLosBJMBSf5VA=
X-Gm-Gg: Acq92OHRulhOmGiDX7LeJEX1L5oxBZf98TAoLrffJDZ4o2r7pdIl7CEqmzoj/1u1WzM
	bXbVdr0/oDj81tHay1FSR5wn1YjQavChB79gTyfQYRDhn90acfa7ryYNUYkAqJYLTZv3N2++wjE
	P51uvkfrOlN173PYjcAGLl8TeERNerCPtd8K0zj76iu63aD/yVriGPoH+iLzcR3veTEXRbRS/9/
	Q/tCdBMpXr1Xib0KsUie5WfKRZniC2eKpZze6A3br2nGCd+fP/hJjXkDeLPRrqbmWajWJCYm5EK
	SyGYeG/4r8FyE7vCr8F6fQHAOg1LNVGJbQrucvjYdhCEoO420UD6EeXesdHkVsVcAYR15obXwR3
	HYUbE6g+wpOkCV8XJs2dhFLwT5iNcwvJ93LQW1GAdfcKoG5eowr43oGxF/6OhbxPmS9EnjVR65v
	uVUHhZVEAfuOuvhdQcA0fvoq78FfVillf9ZDUveNOHlTbk6UlwGVt+TM+iqQe6H2WSCRFPjjUQz
	t3Y/gRYClWR8lGwulugmUZ0Lw0bxU5all3L1i9QgUFcE3BsqWXzD8ZvDwY7jMayWzosJQ==
X-Received: by 2002:a05:6000:40d9:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-45ea3cea561mr6344829f8f.40.1779386987437;
        Thu, 21 May 2026 11:09:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa935898sm4632173f8f.28.2026.05.21.11.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:09:47 -0700 (PDT)
Message-ID: <ed3397c7-bd78-4236-96de-82dd75a96ae5@gmail.com>
Date: Thu, 21 May 2026 20:09:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
 <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/26 10:50, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
>> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
>>
>> The enable GPIO 36 was found by decompiling AeoB dumps [1]:
> 
> I'd like you to strip this from the commit message, as it
> doesn't add much value and makes the git log unreasonably long

I thought it could be useful for other people doing device bring-up
in the future. No problem to strip this in v2, the info is in the
mailing list from now on anyway.

> otherwise this lgtm
Thank you,
Jérôme

