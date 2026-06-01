Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA338BF81
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302605; cv=none; b=dezzu4EO07GdjJukX5RsraqdrQhYNFnAQ/rLYzEDHW5K54fJZFsI0mFRTMPfbWd+3+R3vJ1guXdFbZ130fwhNIYZI2Iio23zBd2qOlCZo1mLhTu+1WW7kEP18NTPcvqmmx1mPLJzHwZRR4RzrmRyTi1rlubaQRWn6uJuRhm5UIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302605; c=relaxed/simple;
	bh=UwMCGuCUG/G59TsR9qdiEFTMtiemrGM1GHLA+rls0Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuHGAcK1MD+bingY40pBnW17E97vllw30+xuSIrNrC0Q44y/xaXFtZ0iCjXVAhV2hf0kZSe/uvnxzX3ghwS1qvLRbxwoBW9KG3Zs003Z+qVzdWN37cd/PwCVgn7eR42SMl348SyCfPAms5LzeniBqqxcps5PwZ1Y+wbsJPd0RaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT4GgwPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y70QWgMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT4GgwPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y70QWgMh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65177Vej2948453
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 08:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=; b=lT4GgwPi35xPJOEn
	XEGBJpKinD1t8R14tMZkVO2XlhmEJ9CSJJPR3E1Knp7k+Az5TpJWLjzILODDu7G1
	+bkThFkpkA9KIFBxAQyEyGlXTGp7FDaExgHlXm2GdgYmQeF+0AVu3VrJP2M0rnGh
	Im9cjci/hOIgr+o0fYhuhHlfqJSjjRkNa2bwCSP8dw9mlBYu9GnD+ZBvnarL0UyV
	rWgmJbi/OXf05O/B8S3zIqJkPsiufjpyniny2Gyz8FJvIzkVSHACDKBsikJktY8A
	ucIS0ABJZyAXtTnF9eOi04qE34jUUi4RmpYFrfS/eYGlBCNV8C5i3hNNe0jbv9Tg
	dYARwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fepf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:30:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so3730729a91.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780302602; x=1780907402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=Y70QWgMh4Zg+jBFIrhXnINsh76yk60nTtnsehyxNDXiAb8T+GZZMvXxj7uRx7TATtT
         JKK3mkDqnreSprmKIJ+eA7rVW/uHltaizugzGLR3sb3Om+f0zVETF27ZXZCODC4sleUd
         LvxNaZnTkdtc8i/7UzSCf2ZL49JxPiNeuUtqaqvR3KiVZZgaL7CgI6pDhC2hdOhPCCf+
         g51p5YiixQtSnM6rQOxfmNWxYhvgrL8LRQw/JOp+/8Tgn750dW2NiXsFAiZWiORx54he
         WYRrqwYaUA7YfN+j9tZjPnuUkio6IUfH31av6IRkAEj310C2dhJJSTZVxSJMNtC2cO+3
         0EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302602; x=1780907402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=FL9mEyXYheRWeynyhuW1hFHdCKLJPKeXBoXX8z08Yby+RLy6HqMZ91IFulEJFX/7GD
         +hF/6rZH1zmrlsCV+huA8NH0oGWdf8Yl6GM4iA/LqO/q3QVYIz+if7hpxtUVG0WCvmmW
         oV6yVfwk7m++osuPGUUnpAZ09FEqZQUWnrdJvXVzsBCR1Zn2ynfQapn79xpCqcfSJHfj
         flffkUf9OT+BYa3t31JxShR4B0AVXxVhZX/Xcb8OAtYgWRH3U3hFjJjWQGgSYb/RoFg4
         1ibRfRRLfxEIpBAyYfjU0hzv/6hKCYX9/3hJkZhHQYZHDThWnxS/mqgSkz/uDC2IVQUZ
         WiNw==
X-Forwarded-Encrypted: i=1; AFNElJ/6biTMJqGPuj4fqYeqGuiN9fbzslqEaph1y7wHY/uQyH35v2J0rqVsva8yk4lO4vg7REEkiGvqHWYQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1V2YPYwB/dd2C+2ZU6yNZtk6su6ttsGRU3uV1+23J5lIg+4l
	2KqjnuxGfMrf6ujHM/1OXFDa/0ROitmOdUwUGR2QDWPUBuBG2NBNYreB268D6PwXPTyQdwNt1Ta
	MyhD+gRIQ0163eAvhtPwsH5X8eNdMVLuXKL2CJLW1L9tI1Ww8BMhzMWc6U4pj8XOJ
X-Gm-Gg: Acq92OGZgzqwgTW0QwTPgqu+01NNm8rZ39N5adVpRc2uONxt5VYYP47y/LU/dVwlctz
	I+R4TEEf+72yo6gWYf/Cf2xoq0Hzoyr0jKB9sTP2VaqLzLRUSdAlc36ZI7OzM1dPqaF4XffSpoV
	06JCAgJWuu2pyXsEbQirpy+3kKRInE4kmQQYv/NCmCFwhVStFSd9nYE31PPSZ8zxwxt+HH5JH1U
	NcMNgHFInYJq8TE+AtIA4ERuy/fepJr+8S1CCJA+69keCvSM3pvLInUYwesK4OVwOydWXjFndYN
	qVLXXjIKKQr9CzTvyzp2iZMTIZnhM4v/dDgfL0PnFjFcwsDDd2wBYt7UQ1nmBGp0dyrB3t+3m/4
	vlMcq/6YzWbRN3+pK/2R0Sdska+u71tAg1wwsDHPn9VkdLUgkJ5jq4LTiqHg=
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044991a91.5.1780302601931;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044975a91.5.1780302601467;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdd1a855sm4491346a91.6.2026.06.01.01.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:30:00 -0700 (PDT)
Message-ID: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:59:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LBSyE0kEBD85GBvbXos1TZhj9UThu-IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NCBTYWx0ZWRfX0yMo7WA/6hLM
 4WWbbQgnLcHFh4IkAfOlyQYfKbsG7k/4XJD7rcPvZDIWkLhDk6Dvf6SGo8w3zSzvsxKVUEXxwI9
 WSTC6X355cakBcJdlMu7qlOzYktw34byoLd3VBlXATdBYPQvNSxAWJPci79/xSkJO/G3gZraCYU
 8H70deJ5VGtwPK8W9UgXPDCDsVzDq0YoyhUwvoQ71/8Ia53vPhBsL0GaaR6GlUJn13sjBvY8I7A
 dNu5+bBpiGdgGxNfLXBbM27i1gcBdYbp5GxMabDNRM9u+64EELGBCDg1vNJVL+A8P7hvn7nBu0G
 h07Ai6lrj/G/iR2FI+rFXd4aod+ZQ/xGZMU/D5CyjulzTrEd8v1T5/fHutU9bzXTo8Ol+F3sank
 lQ0BTOb70px+2qp9RSAVco6CfWrPJBkWHdvZx8S0DW2FAaJJkNNoOKgM5LemDthO7uyi3hFPQpw
 DQc4J8XzIh50LQ6K73A==
X-Proofpoint-GUID: LBSyE0kEBD85GBvbXos1TZhj9UThu-IM
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d430a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=uEUO8UhmWA4g_SfyP1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010084



On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>> +        pd_dev = core->pmdomains->pd_devs[i];
>> +        ret = pm_runtime_resume_and_get(pd_dev);
>> +        if (ret)
>> +            goto err;
>> +
>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>> +        if (ret && ret != -EOPNOTSUPP) {
>> +            pm_runtime_put_sync(pd_dev);
>> +            goto err;
>> +        }
>> +    }
> 
> In Iris we do
> 
> - enable_power_domains
> - enable_clocks
> - set hwmode
> 

This sequence will always ensure clock can be polled as the GDSC is
still in SW mode.


> Instead of
> 
> - enable_power_domains
> - set hwmode
> - enable clocks
> 

This sequence will require the clock to have SKIP or DELAY as the GDSC
is moved to HW mode and it is not guaranteed to match the SW expectation.


-- 
Thanks,
Taniya Das

