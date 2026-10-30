Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368749;
	b=yhocPn+PpHx1M2bu2WosQc/IyI/SEsl5eDDCDCPU7Gr3V4gDILRK6ajzz4jgHWTB/1Lk
	 qKMhpshfkhJv+pzMrG6djVXhwjEGjosn948OZxp+TS8xsdhjMyIXCGLSmPNC7M49ZvnpL
	 meHcQE1SQTdl4tki9sn8k9TJHBaXbicwfErkyslrTuaf+LU+Jnlw2m0w+Xk/jIIv56tys
	 293WkgWGryC1BKoxEG0l964bi5PGLvQul393o4qlW6DPQUwSS2f4BAAs7zTq/j/YV/enB
	 IGvzYlngRw+6ovY1X5HQYUyFRYqJ5jPiNyM2hPVGP5OoLKsynlkvV2iV+Z/vnzuyjAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
	b=QIPOcrrIpzVxemJwYQmwh6lHP4DrQMGVP3KEBTAFXmYFnIpIkNh5mwyoaqaNGMsCON6i
	 MvzF4Gpg9TDdjZbGxtmV9nvxoMZGFgvyEMy8M2Jow3QTV6cZFLLj8/dJfm8u863959QUv
	 W/wTk7spWQbEZUf+ggXisV31qHCKI+DDETGBBLAcb4sXtik+e+YKBlXZbFqd2tN0SLRjo
	 pYurIsGfyMHv+0+6uiNYwv4swsYfDHxPTZNqVtb7UhoWf0eN0UQhvSApo9qAfeoLbc7Cr
	 UYAKMm3seHj78lXoVAtW32JUgAm/11hSxP5kySPhpl0yEx5inL6cxf8V9fHkQhv9MMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlDwZ3KO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FncZsuYW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC20606A331
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC20606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlDwZ3KO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FncZsuYW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnEZd4019653
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=; b=HlDwZ3KOkdTPzGNO
	jok7HtwaaL/VhEXI9VX8+t7EhGByaWgNGAuCqjl+1NxLxFDkuFO8J21qU2p9IrMW
	8fhX5vy2CjE7hT6y4AJ5VEKcgBNA4RDbOfBB9jblPgbxke38E1l+PQUMNKMASf1w
	Fl42YIk72iNoDVOGX96ktdJYeE5EN2dGgDQNkYNzenOeFq/fQ6SBW5kkNJsI1Wuv
	DibsI6lI4aL7QYdIeKqrYEIxVF8KVBnz+JpR0n0nBlUfIXBs5WdNTVWr7T7XkS3Q
	UFFLOAkmVnPPLR4/ruKUX6OPqfC+aANWOGUI9vh32PZ1rqDPX8bHIwlOoOZFibk1
	r2LUhA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:59:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso976509b3a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368744; x=1793973544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
        b=FncZsuYWmaEcChOpkMxfqC88o8kfaTx+Eng5k/s/DvDJJWPOkBLO+1J5Z7HnnV5yDH
         Rz0dkZZN1uzmeEbVaP5cbyLwYrcQrOT3obqxpk8xYjWbkXR72bhs1ML2S6Oj9ImWl3By
         V/JpChRYPTOjWGgDu4noF05akraS4YoaawZcWFwzCpMrcdBORw19vWoCkQBc9WqjAqRE
         iXQw2Mdzt6U2EE3EGt1pRbtq9tmZmhFW3Rx86ccWgPldlBn4bn+4JmlCm4JhhiAbs6ft
         K7HUN/tgMztzB6CxCUPDBFW3I583NwEBcX5k2WktHixu17KsSNJrni6J2/Ctzt3HfkSD
         O62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368744; x=1793973544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
        b=ewt5nc+5v5Y3qOfXTDjBIY8FHrIuKGpXGatmiHG0ptm091WiTL5fZX2oXrHlCCopZY
         tM+svCahFmtWgaDwy4UqZ8Zxatr9di1+Sjcr34f6YIhgscicDONqehpP9he8kyR8JBKP
         Y9T6jgNccSQCWdlQSfPqcF9nad6sPPfL0KoVlNpToZhuQAWkQP3EzecxV1zveR2IiYEL
         edPnXXX47ZCTPNDMwpPxLoLIkgHFakt7HbNps7SHpwuz0aiLZWTWU/MgQRYBw+CWO4QG
         MfboLJMCdOjrs3UAw8IQ4xjpuX7t3yAWKGBVabsyCHqgJ2lX/uNKxBx1vd5WJ/uips8d
         3jrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRxaTEnnUaFSNuvGsiGOPawmvVwc7l7055Yx42bOPUDuKxcCtmeYte9W6hn+f1NpkR37uzGiA2RCDv@vger.kernel.org
X-Gm-Message-State: AFq9FYJ61HZTgMUgbVEAL8791CuYh6lk1q8cW91ScUHDKqvx4l8N/DzH
	gJrpiEbmJG/d9Fp+AL4U+C+ZjzfK6WZKzQXVzyp88uLXUwLTgTp1khrCmnUnH6sWZEgKqesIGi+
	2qpqYswW3sPlvns3atHKs5f+gwi5Dw3yv7NRLsH3htzlGB08SARaiy5jgOa8ieDzG
X-Gm-Gg: AYBFou2RGX2pnfpgdn5YjBlcsrSYd+DV0o1FXxPgE380DsQkmw3H6JvQPag4PX0ofOI
	HOvJ7i0/zST1Ve4HU8/uPeGCl52i2YVvKtXSBghWs1QbZAI/pIf/0QYiBafhsMtxcmB71akNDWM
	YSoI2zadCHmYFGNtBFuakjyKQb2gjEKQ0mtNuJHnqWvAEZ7H+jVF1/GV6UTrQ4JsXelb8tAp6Pi
	TZZ2RMS+0nY1qpoZDDJE2/skOqxMwFOr6I+80u2k1dL3QA7DD7jZ1dsAceFK0sY0BVIM6XVhPmR
	KcPt8ZTOnabsO13XKUu1avSGk6Y1krFRKWYJFpuy2OHMnRKLSqg5nmi7flBqTCuqVGRlaDv0rgP
	ATEc617S5RVN1eiH/jhFq+FmzI8s8gUH4QeHInRqeAbJiBCqGIhKo69uk6kTV84DJBimJ+5fRyz
	DJYdQ=
X-Received: by 2002:a05:6a00:1783:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-8a9bea5c399mr2307957b3a.31.1793368744464;
        Fri, 30 Oct 2026 06:59:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1783:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-8a9bea5c399mr2307921b3a.31.1793368743970;
        Fri, 30 Oct 2026 06:59:03 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm12882b3a.2.2026.10.30.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <53640a9c-395f-4faf-bbac-20c47013cec4@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 19:28:57 +0530
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
Subject: Re: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
 <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzcipDaQMk863
 cV0SlKLLEj7jx14OVgYK+L/+fYHyUdJPk7bs1A2knCnwhURmMa8Wh6fcgiLT3M9bDH700bEnlKt
 VPf4WDd3RFnw785Fs6oUrMaUx8GrEcHYgZURIo4dhlYga8/Ft+0PIC21xX5DdlvnBBaWJWRo/wv
 jEPlfQXLaM0j5pStsIVEOw/CALLD4upkBttvsEuaQM8/cOT4I+efbd+FiZnp/CAeQWkOU3EraG0
 VOJLmInDMl6F9q28UE6LosmRQRxKi6b+868V+VsJ2GmUPvpGuGax+2VfibqD2/lt39RPig6Y582
 ve+M7RprnFCvwwe8T4UxFQ2fNIMNnpPfGb1hd+bcf4WmZREKKDHO6c2q3NMtf4Q8SgVYnH2Q4fm
 uRTHXqx1bZCDDQ0qzPn4tCfBPcAavrnLlIXvQDXQH2uRDkBg9SPpg8VPdsvg3mD56oc/3EEOq1q
 C4prkgFG17Crhnp+Uwg==
X-Proofpoint-ORIG-GUID: C9HwwUDfGANZpSxCQfQr4c4oasMtrpdB
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4a2ac cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O4LJdId_ek-TerMgtbYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXxViqtRAu0jYC
 VogVoMG05Od0sHwQdSzVnWO26ZikpEI3hfBYPn2DbWxFLZxlnprb85LoiU5OGq85nhPH9JMpZ+B
 YTgvXMDRGXqy2JxEGK3u8U+5geRTCFc=
X-Proofpoint-GUID: C9HwwUDfGANZpSxCQfQr4c4oasMtrpdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054



On 10/30/2026 7:06 PM, Krzysztof Kozlowski wrote:
> On 30/10/2026 14:30, Jyothi Kumar Seerapu wrote:
>> Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
>> instances configured for QSPI operation.
>>
>> The compatible also allows the driver to select the appropriate protocol
>> firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
>> distinguishing between SPI and QSPI firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Where is any user of this? You speak about driver, but there is no driver.
> 
Thanks for the review. This patch only adds the QSPI binding change. The 
corresponding driver changes to add QSPI support will be submitted in an 
upcoming separate patch.
  > Best regards,
> Krzysztof

