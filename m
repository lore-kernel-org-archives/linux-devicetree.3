Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F893859D0
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917804; cv=none; b=OShi0O7Oa/om39zU76ieIMtPJJFswJuYD7N/Qx1j6fqYeSgE5UQtHUdvLEpdmCKNaDZhdBXPt+1HRSUa2AtbccgGNTt6tKl8sX3OgQm7OasULPKO4C0uCd4rZcO4r3P61YzmNyl/v6Tk3uejYWQ7KQoLUW3aJS90WkYAQXnZtKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917804; c=relaxed/simple;
	bh=dO6LWOlr4W9KjJsIaQ/g+VU4Ji5TInycrleQSx3ONUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlyXGUs6A6cJ3AywvsSYRGz4wi/eRviXHrvpHVdVki3kDcpJ3mqc0P0QwdYUZhqauUw4KBE8WncV1p+fDJDv5xEhNT69uE1q4JIJJXnJ9VGUSRrxT/G7e7BeL7GRSbN/DMCH0wi+YfBqGz4qZEbbR13IegUiTemljmsJ2+rfas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov7P4oSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeXp9w9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov7P4oSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeXp9w9P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B40TH93910030
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Odlvlj/6+ff16oUwlM8mU+eF
	J2ei5xcOmDMIZAsnvOg=; b=ov7P4oSRmfEPABLGy26lijgLv1dW2hA2IXWCwrtJ
	TKYszGPUBKjyCbH1coPAmskAIp7cw9/VkKg+jcDXcmhZD1tw1H/YQwXWsta/3ljX
	HQFvTVYzuaNdpth0iufnHaKCBvgnJxrgKKptjfGJ8FCT8hohthSCkUicu1qLRYZ8
	sl9wV0aRujGE7y449mTHLOFYJxgo0/dmaOritvwR2olK0zBrMZ2JV1+V7LpG3LWI
	JyoDb9KHzMzWUTY7LXI8UfdU+dCUNbmLUlEDcu+Bnl54/eLtSzpzKXK32ba54BKX
	xaoim4K0DfNKBzXXSjUG9YU5CNH7YI8JyHxHTIIowmTPcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00v8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:30:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d65190e52fso592582085a.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917800; x=1776522600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=FeXp9w9PRJpIJuidF1+dXiq4iFgI9B17+yJ/ZsjsW78pVFQyliAWCuF8bSiF5yvj85
         rPv0TqmWZTYYSEpjNUvU10yRG60ydXEKa/FPlAcVj917hLMbsF0M7yzYye7U/+qGnP+4
         2djHPrNla9/hNndMwBYFj1Z/qDCpBxxpVUsuOfE+YLD1lGMno6FVWf4cM/YLevfnQ/Qv
         GRf0x3F0LISpb6HePu66LOBMmGjg76OCUns1lRBMNf8hN96CnOyye8k8+XCoDk2eMbgt
         wq11Rj/sHpk1gwlDn7vm4QlT97QF4qOJIqucfNjl9o9Wpa0CWvf8OMrLoBqoYFs5cGJo
         CBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917800; x=1776522600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=f3D6OncUCqpCfaEz03Mx3asE2UOJjuD62A5m3RbijqyKMZ6WTea7vYnm1DbgXEFimg
         G02prwt992eP+uw8lG2azhnhQkjQLX5hf8b3K8hyhCh4uGFpiI92bGfIqecGz7peqaa0
         v9u5PxmPJbKmB3h7Hjkqp6lpBZVt0H+vzjmmkmxcUlqxcGUn53qB4ahfVuOR5wwOifMs
         57aYTGaAJXXUmDN4rlkT0GYVhj/c7FfmreH2bVYaCh4+fXsgn/4G10Y/xpO6cJ1L2P53
         2Y1aChevYRgWuv3gmnto49aNVKFOz9QdFaGJiAdPVeyQUyfIUxf20k5Pn+LC6RnTzdV4
         58hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvDLl3D+9vXw5Ya5+AgQkFZTOdBYdkQa9zFdwc73X9x0gZn9GW3M2loskeztGBG6U5G5Ix5Tt3DzbH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LzZfAQQ+umBFBmLad/nOW1LK6rG4GmSBdh1p4toQhGYAlq51
	qkpWK10/X7up32IOeKs45AiY/lXgTwUGo5yvv7OCu6P5H1zV+xNdrUu4F0SnxDH+fjBY6aIdYiR
	VK/ThwAOIQyxUtw9guazvTihdM0WHdIzq7NolFlZU9ff2WWJmvBM6KgC5KRO72K6f
X-Gm-Gg: AeBDievNWUL+F4UYzYl9RJdkLLJ2ez1rR1pk45FzX36CQ/qf5a4TvXFXD1hTMS+Nyac
	JV6/NgflU341ZNJGP/7ct2LsJ/O/e+Jc3jcn4seyzrEaxj09qYCRkErk9tDdWVAwjZAEIdgPbhW
	S3TfmjvvxCkwaPP3oDgO3UCDIhb8S0spKUnmRBpn9VDuxaTO2RKyohfN6j3upPJlfl402QPmt2s
	FcpyiBMHKiLtb1cMiuR3FwueFb+AuY6aIUfljzdnOkCnvlZQZMZpzEC+biSmMykSsmQookudEM8
	plB/46fYmDQSm7/88wtpNb5Blnut7kXXikyTkR/HkjXIq7Vr7aAHUb0xcn9ogvh5Q7G6TMZmTbY
	ZP7EElmOjoPIz4Y1qWpGH3X//cEKQVDCxKsMMi8A78/5O2FvC87hv7NSfe0ahm2/t54FuKX/Eat
	Ax53qJij4lqLp0FNmFMmvps1HvzoPuQG4YdMA=
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442721cf.28.1775917800268;
        Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442431cf.28.1775917799799;
        Sat, 11 Apr 2026 07:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee865dcsm1472187e87.14.2026.04.11.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:29:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
Message-ID: <glrmouz7w4jomzv3io7gg5u2gtwrbm6zmhk2qcivlzmdr777t3@5w6dr3g2g3k7>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
 <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyMyBTYWx0ZWRfX8fI2b07KgIFj
 C6+K4HKnhgXuh+FwKcTaOi2ZttsPMRye9mHJ9C9JzBDDcgP16xbyCiddfRR9Di+E3l94dPn7C1z
 MjOWi14MxQaZCM6lq0x5PHvRXcD4xVimRpmE9p1izl6QfKB/ePgp+eQc1mKK5XODJQk/pXHUJ1o
 +5Sqlq4LYRARpOfMN5wDZ/hSTl3JyCw6sYBHcTrYQA7QSxaRLnVcbpmNP23rvQS0Cjt3iIM7fsx
 Qa8RvIBZPeT51YxrA4oRBcqJEoYMu/acNqC214v9Nn2cXgFQMEALRrhvCbNdItE8GTo5p9IBeAZ
 UPeTeUlS1+LD1fLBTnyF/U7oK650hzOXf738LP8BCF8laVSPdq/cYa2u4JnO2eglYPx5iSyMMRR
 F6hvvEEjj6rxW/uAAkbkorEHPBZ4tHxNA4WJUSqXVtW70cBEOOGIxpJp1KAg5bWahGL+zxwqJz5
 m5n4dnxYV4P3p7lFxIg==
X-Proofpoint-GUID: wMIO4E3OWSDMVR5M3saZZAsm5CkiDc7w
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da5ae8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wMIO4E3OWSDMVR5M3saZZAsm5CkiDc7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110123

On Sat, Apr 11, 2026 at 12:12:03PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
