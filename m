Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B740BCCC
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824039; cv=none; b=LOOpcGyfFCsH1DBKbspdgyP37oS3b4OH3rLR05ebVjxPBQBUJqlv7yhK2msGjlRWtmbOxSuPZRhSTNluAzzrLBE6wNcIhriIzzc/C1GgQLOmm+cbvHGWcwTsHZCaRK0r5agyouh+gbD6HqzAUX0Gw9QkaqoST3NPViGXzL7sEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824039; c=relaxed/simple;
	bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/yxLctwPApnJQJy7bsPQIF+2h+urin0Cq6rC23ln+tk4mzydQkNaDGOkYs5xGOlskyiQCISLSO45ylIARfVGaAF5Jj0fWAm4LAuclC1+ask/GD9ktyl6+al3M8JTKKzenJlUQOCxtNUA7on034zQoMsOPbo7gEFMDYZBdqLAOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST/5qwuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9dL3CuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST/5qwuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9dL3CuZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrFb1602630
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=; b=ST/5qwuLvYI61b2L
	UpVjJrRP+JQ5Y9H37FKkLLWmlCpJi79TR+4KctE6ShYDfIf5Ir5D78/ge2SUogEz
	zX/JPYOcsmGYVv+pzIhohF3p13DN2WMYDxsKpuiyzulfLy8ese4xPbqCwsfGXc6L
	GnqBCZ8SHuPg+EneWuHe9iChqRzjQA+hO2zson4PvJm64h6LBKL0Pn75jSuDiihx
	xLgeNKDoeX8+n//BoYePRYoF+cUeFUsGiKfaT2PJKHMg5ca/s2cyNbWckIGTH6Oo
	O0Ti2NIVZ0Q0XghZ2xUccljMx2FMDoIPLw/yI0zVvlfmV3BNGYZ+OxlLIsBcI57M
	mHmjjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpryxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:53:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf9df2eabso1113561cf.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824036; x=1783428836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=E9dL3CuZLUlXLueCA99Gfqkf6vNj8Nloj/NVSWX34WaLH9QX8RmGao0eLlsqACYayL
         IyiTmUQbwG/djCJLUe4UCxvV/XzwNXDqRBDfL+pbQ2K/fZV5/WOJ0L0L8NwyX1Cyobcv
         4dMoQelDJT5nM41MamSIQB9X0rIqE909gDp8rQMTKMO1VpETB3F9LBXEcZ+IZKc/hQ08
         7869U3mZ+1IELRAOcVUJGPoQv0GVggCyFrm2rH9krnQ3H207KUR8NodMAjMJdOngoV9t
         pwQeV1195O9ADdB4WQNtc4D5OHzT3GswfMx+9RsTgPmiw7konspEqK9k+rrRpKpPcQ1n
         muDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824036; x=1783428836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=oJu+IMpiTM3i5w6GWX+IX8AbzCOj3lX2mVuRb5x077BNIOb4QRH9uZJdoL7ADHFOCt
         L72vt0YOmKUQlWQULG1sFZZsRdlikUQ6KYcM0ASyF4DydplV3UGslurOpZdssYjkjozR
         h4GpNsp61zdEIcfPXq/zrytu04WQN/vf/qDriqlFUpekEW9bPT5qK1pTie72+ClHh/HR
         lCkxJGsh3eOWP8DGc93N540Wa2j0hsQjg1mjQTM4Ll3ucFyyl03ckycqwFSIMYmEiShz
         a8jA8xeQG48EUmO9F61+1kyn8WSybooOeTsAWngp5SSDbNploiiHUgaPLuMEaJJxHQi6
         kJLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kLwz6j0n9atiZbh92iZ0G0FrZxiCVqjRq7xi/ncBzA8jcsrtDjqDZNP1FTbyZ0ZyXHVF3UHPw98Zi@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmJdR/67zDALJTYczxjzTKcpbXFL1z8+D/jMWqhD1BLtAS031
	VRTMpT2P+ugBAyGOM7Ox5ZJTc0G6KRLWJ+pQXNpau7znxv3z6DDDJd09qBodujZ/mnzTlJp2rfA
	FFyGFw3AJ+rYzt8MbdT0dBXJdu6u5APsczBXd+SuxJ3Co8euKnmWbfFHBMxAUNRsX
X-Gm-Gg: AfdE7cnndcvK7p3BZo6Fs2JNhPYDI0kyBsTceik31S23kI+nT7K7OOWR77nIOWe+5kz
	bj+9HRj6PpfG5hsGgXAqJk4v7MRLuwAWJLXjUYMDY6ks9ZSzpQvYatnD0IziPOYN4LMTWC9bLvV
	a8CHnUyq19xSN73p7XEfdgnXFw32md3zuaNkv6f8PEM+a3png2pxeZivQ2ZcNdfi4EUlF3lV0yw
	yvwQf0fljrzb3z3Likem9wh7/U1LUXqLvAbVJOgNUq1Takhg1VZiLnL8dFCqkC7ZYnXYe5TzdaG
	0XUwoRM++MB2Ou5X3LNov8ZyGD6h0EDxNpyI8c6EJWIu/noXhwfNjJs54x4MIgfn45QnCUGxAo3
	c/nGkEUlOn9wKGPGS51MlHE5dYhGIkJBK+MM=
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32761271cf.8.1782824036441;
        Tue, 30 Jun 2026 05:53:56 -0700 (PDT)
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32760741cf.8.1782824035970;
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm121297366b.3.2026.06.30.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Message-ID: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:53:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jHRvzt1cI3SlDG8U9GxFZiIsqpziL4yf
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43bc65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=keZN38YVYYl-MFWHEpsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX6L0ea1cuPj6R
 NKCUDA3yKhNn5zfNxyx2Bmn/4z9KTtyo5rqOJqgMPIBOridPEKHSG9gMmbhymYVtNK3Mao9wMUI
 02pHIHdg4dHfa0awIRTxFqGKrFBNT3HVBPPKIiRq9iv9Q9/crurRGfgxUaRpx84Sun5SByzHG1n
 yf/gABaVBDxnUHa1bKA/GPWzSkbfxMagDaDhpmuPZ/UbAb0pO1xQIrpv+j5+8mDScqCrvQPGWLG
 uHQ3AtZD27FfTWrMFpzkQKG0oQxRILKXwwYPtzWMi+cpT99Z4eqfYJk7X+y9phqytBUtkLfuFsz
 lzl4up+4/ZQXrV/q262rdC03XPM+6b+dU7ZkqkM/DVeGhy7iV0i9kdQyS32yf3ElVdxcZ7W1AL9
 0lN8PctbpbUcquvZuL8YzUR+rQml9NNLtKSR4aTtRGdcmCAwazdJHBWVVqEVc0hqKNrJpVILUQ9
 K6BLA4BcEVg92329rvQ==
X-Proofpoint-ORIG-GUID: jHRvzt1cI3SlDG8U9GxFZiIsqpziL4yf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXxkO5VZdO1kbn
 SIy81ijuFcqFwEjHK+s3wujlwiszfyHLeEXkAKA8HBbAp3TGRibJ4VEIy53FL6qCPdHOrS8MQAR
 62Xijh1dmEhks+mg2lo6wsW+LQZsi7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120

On 6/30/26 12:36 PM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. The AMBA peripheral
> ID probing fails on this platform, so the device never probes.

An interested reader would immediately expect an answer to why that's
the case

> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
> Dropping "arm,primecell" makes the device probe through the platform
> driver instead of the AMBA bus, which resolves the probe failure while
> keeping it an Aggregator TNOC that retains ATID functionality.

This describes OS behavior. Move your message towards the other
compatible not depending on reading that ID register.

Konrad
