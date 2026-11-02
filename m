Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621445;
	b=yz1IC/ARec5eE9/9BAaRYrpsvfsuFuw4YqdHQFXIc/hCc5ULBvIDFj0j1hv9LqRe2k7x
	 /XVwjgfZpc4cKSs5TStmUHYouMlIlumNbuh4cK+fWkpmrxKylo4OSODzk17AmK7A34wsE
	 mc7Xfbnto7k9Jg7Jj8rb80WtkwzyHUJLaJ4Cp3HQtwn81sQo+9eHx2IK3h1v2v8WnSOzK
	 +7NZQMAYRVYaadLhensM8BevfJ/gy98XKLl4axCSlUy9rVEyK7HShI3EFpheC6VVEIktb
	 IeIhHsT5yQuswBHP0+q8c2fYVoH6kbJZxR8Lj/ycQy6Dm102cJ4y52eb1IkJYdVF9Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
	b=ZmbcKbVtBvpmKis8HxQGFe++Y/dy+Ov8220JqNBFP72TuGBaDa1+XshoOu+Fxk5VNmNH
	 6Y+tC+lWxExUF9AKHwI3Gnzk2wCndO6NY1ABKx7xz6ti7B9fz3b/my0QVk/Oq/T8koVPF
	 15DxJvgTqqYGXAqaywmJspJbAOxAboqUhD6rOsRa2A/UNhxZvpB6sgcnL3/fVsdFeYLRh
	 r9qa56FVwiyvM3ABFHalExjLGNIdC/FX7CCiMhDOh5sVeKlW4ps134JJw9Wrc794g62PR
	 7ILxLT/qo6IzBSO9XbEoTH4Goqx47kCgJckWTedO6nmsTtRDT4CHX2uIr5UrisJ9MRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032F606A335
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F032F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6AA213989
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=; b=JdUO5B8jkzGJ1ghc
	dW46UKYpW53M6pudO7cL/b9JbRwchvbki93C49mCB+f/o0rUg+RAO+wlDA/rLu/d
	POQXRPEsul4VGt6V1oSZkT/9UY/5UzYwWAgifz5ty2DPyj+2krgzx+mZ3UYag3Qr
	wns7LaRerRJ8zdqa1pqGdp+q0ZDhs7krdryL12+/XXmcYIv7jkWuIG9HYu4WkF47
	mH44wm7A3MK2Fr4CSZdprKt36lpBewR/TAleQZiZTnzoeRwv9jh2EKErFQp2X/hN
	+V8J8Mam54afXT361VTH4k6rnsjZeMwNyBBUgljk4mdEZOAEbXef9vSbXYlH0fSu
	mMel6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sh4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:10:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so80098e0c.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621443; x=1794226243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=GTwzGaz7bcEyz043JmfvUDzGfgwtFJBnflnOkMHafWLP+yPDkTFzq7PE/o/lnl0KQ7
         R6CkJFlvaS4fdb53PVkmws3l5Vn2e00+1986yHA4kxCGADH5dKtHG43DMBPiw1aQe9XC
         ORtokr1QCO5ZKy9a0uRV4FSAcJfQB9T9ycCkbH8gwY4oIcBJFQrtEvNRF5Tjn3ciXcY8
         d8hZAK+0LzFdGEYNL0SEFZJjF6z6jJ9sEHtJ9YEsKcqwSveaccOTpAwqvMjrAUQrerWt
         KqRMtAgug9OPz3rwA0qLTDNyIBtQ/nlIrep9cndwOjFr+4ZYsyCYrhswzoQ/SlXJjjH0
         khVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621443; x=1794226243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=EoEKadTjZWlyLbkKUrzm62AGu5ANq/AGT8p8xXDsBzoqPU+DBYbqAko0qE7KnvFml2
         lxUsQD6Gpjv/zFQ9ScsI8aMpmm/skHuYSrLKCykIVhasXS7pNOqsIpLPFfLhJIG5Dc5b
         ATNlB6k8ppW5Wfas+1hyjfK4C9gCiT0xEBdmi0xTTBiTFknTahMtixq/eukDcjk81PFU
         DHVVbSEAdYJGNqUuyiXP7948q3iQ9rYeKPGGK8MVzmD+rJ9xaFOI9UrXT43ET/9EXCkb
         hUqWTTsOHLhX84X5fsOG2Vdwi64a7PtFFc/RrB/QWApzulP1AplQZ6dG0iKGddsWZ8Rh
         5jFw==
X-Forwarded-Encrypted: i=1; AKwUvBwXDMzDK5MfzMpDTVHQxqndhQh/NpcztwVDsQGWEMxyHil3TYcJ8/rtZ84BPDQKr3kBasbXLAps2TPz@vger.kernel.org
X-Gm-Message-State: APuU4Z/JO+freohDgVGLoxk5yueA8QZy+eRLybh9FKNj8YczoZTlimUW
	HA4n7rkM0sHxlL8QUlZJMhWTHfLNikbbzRbm5t0tgHVB1OgELyjkWfbb3T54JACOVVxetzjvdCF
	vrDmGV+Lw/5CSXqgPRlzBmGwVAuCo4EqGUHQNvmOsyz9u+6RxLD+DRNxpBt0TH4lm
X-Gm-Gg: AYBFou2DWBfY0ldQxCnc0t24zeQvKgcZpvT7WDK7pQuu9aCvtASKhC0eZiwZ4ps9503
	wfrt4Cg8kdjdbozMhEjY5qHi7MuuRob8MrTpscK8bDu5jGz0AZJXXOhV/Ne7HYrrS1IzYOF3wOd
	//kkglFaKTC7oLYLrFcI+yoYc8Os6OF2/wsgKoiVpvxLoRgikwm7sLdLSqepJtAjiRHbd3jwydL
	jx5qs3e09w8sFfKOp0+1jDJVlLd0YfXAqlBOzsThKVYoIZh/tPdqzBVgVfQf3Te9/9E4/sbZqKC
	FHvhqD8uAmxU51Yan4nSP0Tado+cMVgAIdb5q9xg1CtkoyFLEUoIMbytR/oBZzQ34L/N2y6y8x7
	nBRwRdjaADylqx7vM6u4AAQ2u7FEyOYPd2rFlkW0LRIAP3FU2N6mxt2Zc6QDNM7rW3jaH7Yg=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466805137.1.1793621443184;
        Mon, 02 Nov 2026 04:10:43 -0800 (PST)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466797137.1.1793621442660;
        Mon, 02 Nov 2026 04:10:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b51adb58e0sm1042549a12.12.2026.11.02.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:10:41 -0800 (PST)
Message-ID: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:10:38 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I9DCGijzLIwS5T2aEsmFl_Belxm3VHdM
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87dc4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z6bgTffeZ3ablUicY0EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX4wGPeefObwGm
 wdOkU4Qkbb+pxQ1tpZkjLb8aHyKv0x4yQdMDQ4iANVxV/1F55PXG43gaiNI2x9Gxt5Oufc8cGpW
 ppDdE+jaHWl4+XLvct/gk8otmw1PjDXpF0oP0yOeilrpVFbJywmSzMpa1trZAAvqCXXyf+So+Ol
 VIfyRnBThSdKUOjj73C26syIbL+o2bcOfFAmW9gsM7rnQx5IVCW9FKUu6x6HfaQKj5qI93Mgnhz
 Gpv/Kb37x57iib/rNlKdE4LKvL0veQEFmhA+87UXQ8LZrIi2Pq3WPVVU/AUd98oUp8FhKnuzMir
 XBgQr0InKAO7qOyQitXLd920dgMXIzfLWhvnm7jrvcbLpUkL8hs20HW421Oswm569JorE/Y318h
 Kq/KHGoW+Nex6xKMeMBJveI+tdeAFN7cFIuNUF+NcROmTUXXeYqwbfJPRmKw3g5skgfzmnff4Uf
 VnG6yxlh5VW2Ld8AlQw==
X-Proofpoint-GUID: I9DCGijzLIwS5T2aEsmFl_Belxm3VHdM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX3Qr/D4UzbhBN
 QsN16Pm/01nOEFaqVx/M4yg2EfngUD6EGMmPk9EV0VVi1jCcjsH7btLrO/u3H5ZiB7ohOQs/4xQ
 p7xdL7jaF/fZ+NqpUXlRJml2BVV+Vts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

On 10/30/26 7:20 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

This defers the modesetting to the consumer. Please take a look at
the qcom-rpmh-regulator driver and implement something like this:

static unsigned int rpmh_regulator_vrm_get_optimum_mode(
        struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
{
        struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);

        if (load_uA >= vreg->hw_data->hpm_min_load_uA)
                return REGULATOR_MODE_NORMAL;
        else
                return REGULATOR_MODE_IDLE;
}

and fill out the max current allowed for LPM for each regulator

Konrad
