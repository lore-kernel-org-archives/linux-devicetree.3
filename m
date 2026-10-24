Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873817;
	b=4phwjxsUw+eMFK5ZLdVwSdNUnlp3XU4Z78g+5MUkt3Gb+MMTS8jm7v3oFl5xh1b2WB0b
	 NhG7rXa0hdbIRXWG5bOubaeJiPmRMACg62ufMFseQYJ4eJxTwWwmeBcWw2vGlzp4PtDQ2
	 GOMqp3/5ZZS2ZoWwrFVX9DdRNnJPMZY/3fzcocx9A1jncsdwSZtduxtr9dbZAw7+gK3Pr
	 W1vCAjNZ4BBsybnNmKU0/AvWIKS3MxBfNJOU7TGdGAQufsJC6+7CD5JTkpv2R4J2OQVQE
	 X4UwlChSeozySP3nnjjQk2p45x0UNEry+Eq2d4XChu9uK0qN34hRFxQC8b8PEpOkmUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
	b=flnFPTYOSfQ8L1/7EZZ1Oygrddyt4C1rFK5X93Y2TdQ6eEYw3S9bHdLk2ly6zvuvlR8j
	 cxbFSWKiJmXIfaulxRfE0Gn45XmNJ2b9PLUrP64YmNzOEUCrp6OoQDoSoBbu1thSztCkm
	 y0TQs0oSaxrRMlo5RPk54SEbAFOFuAzu7b7KeLzbJTg0Fra12H02HX7l2/fYdch02gxZA
	 f1N6XOcqdP8uEbn1fWlMRDD1llAf03/Xz39i92S80F/jf5/PQN8QbaJtYxYO+/ddq76Ym
	 hb4nOKr2A4H8fm4PIw/7fNL+6wu7SjRDo++VlY8kw2mqB6XB26nHFXsVVoahlrYj8sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD66606A323
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIUEbZ2874594
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeiwgXi1K9u8VMrXK+4xDuwP
	m9KyRDE8crSBulhqGvY=; b=LM7su+fdDMxjVmM4ceqqXJs/RRlJVqAelDJuAUCJ
	VrNAlFqMBnhIct7u++9kYqh6RQHpbbRFSijeXjOYSnbP6kQJbLdSGUdgzD4QKHcX
	BL693X/iNRuzIp3rwU97R3LmTE9tENfArSGRQID0Ih0harZRgAv/94KngIwmxW+X
	JxtxN5X+NYTGSsTHWDxylEbyfLf4xz0gYgrJOvG/EzNa2ZN9EUXq1RgYAH1n3cVf
	H8WcJ/uaeMxSy3Q+D8uYkQ9iSZbwWhc2a4ZlqGxWlFy+9w2eSTsD36ruLmAvwEox
	Pg8ndN4aaoIjchSoBz84JPBw4NcLqSPsXQw+WEJ6/6LEBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xhsqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so328325085a.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873814; x=1793478614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=CGRvwvn1FzpW6ZEW+fWe3NNDpRWwjX2Ifwwd6g9t7JPOPJ2hm1+VKrFZ98z4tN1Eyd
         cxt9AwRvhpqGJpHNWHZykNVoT5fvpU1dwlOgLhQj/wl7ZLJrFSRs6nQTraIEj8P+GrsC
         Ve1WqePz7i22KipFsbWFe9GIoOWiiSNovK0xJwqteTvT7DTt+VdoxEA1TNuOjcG+CYK2
         cpWvKEoQgwexd6DWiRp0ojNsoPJSVs7IGhKUJob2RK0h167Wxv1cJEX2gRB2wFl/oFQs
         yfoeObHupaUG73U+XFl6PT9JeDfe+eKAgoDKkeJU6Wj+jQ4RGaPDq274n0u4CIJC3IzN
         N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873814; x=1793478614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=vbT9kHixJAn7CLYyjcMiuGhZTL9COedxSzKztiHas0psgozBr0uzuQVIJRSLfGO2r1
         hv3hbLLkaBiZTnHwzbMKYaxuW8xQcCwsqPBYeVNQavhogFfUkPsiNQXs65bPmT09jPTX
         lfqcnA6oxvT5ye6v/m5S9+e7bagaIq36fqrACLvVh36f6gABV/FmLqNX21f25O+HX8PN
         /zhSpKi3NhRDeuYpZnQGFOG7enxJnl6Zs0xGkACOiquwD6hhFVVXtzgWbnpdOPg+Gkls
         LCMik/kn9cX7ruYdpNYDkCH8w0d1V3iyFHfjOf+XwesiSbcaewElNL+MZBtLUz1/9WX7
         POkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/wmsUXYlBjn84ZVsUC+4wK/hRYlApOR41KhVUdVgYiWEBLpQ1lncfiI46L1zoslwbqU5hrYn/h+eH@vger.kernel.org
X-Gm-Message-State: AFq9FYIDVpFqNaygPT73fWyRKzcSFPLFprdY1XPqZRzI3YKlhnyZtrqB
	3rDPC1KuPSPJ7HubikX9YLeBjCBUyrXl7dOXQLptmOKgTs/BcincAjg+JEvraDY7WmzE3KM8Jk+
	nL+TuMtzjZiNYGZ0s3HYP9r2irvyBuy6liM/YlcLN30xPzcYUAxhTLG/tVzbq5SxL
X-Gm-Gg: AYBFou2GDg3Ek2OJiLSCaLV+oP+MpG5Hk5nBt9zGqbKyCkqplG+7/iwfCOeg09x3Laf
	q5B+ARn+xVtbnglL1lEVRlsluC6mxndQhZWDu3dXQE1dhHyez2o0EpYp/a6zt+7qe9M7t6oIGXC
	/d6/0F5bMnfjTrIxAhKgfUCCLDY4+CWYiObVB8PTBdLEpusmqxw+shJsq5CD13HtBeoam1HYnds
	Cq5yrtVl8Mo+aMMpL5namhL2++ktvU+//KuIZ3Nl2LtPX9Q2OVzpB5J+20TdTljfr2jfATyKdTo
	uFGdhpGHfR31MPw48KRXqHZ2e8B5nfBKT1Dwhlwbd7tkLAOpXm+czNfYxZtb05lcZtj8U0rUr0O
	qm4RscSvQKQYRPCDz
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409042085a.49.1792873814317;
        Sat, 24 Oct 2026 13:30:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409038385a.49.1792873813758;
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm6746311f8f.48.2026.10.24.13.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:30:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
Message-ID: <k4ogudreh2a7ug3mtovxqyelip3kog2bz5vswtjryba6hk7vx7@oervurjnf22q>
References: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
 <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
X-Proofpoint-GUID: qAn5SSoYur6rbH8Ol170eSxOmGPTmC-t
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add1557 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=AqZmfHzJsoaMp3Ki:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zDk8rvenn9N7faQbNqAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXzaekr7AGw94J
 WF3gkKWtgaEzH82csYjFJzZ3aIQYME4IzR9e1ye3NHcHxV3JIj+3m3RuF3RZVBHxP0RNv2rPlBt
 5+OIyNC+ZQGNQRxPIvzgopXoFbu51LI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXzugj2umn4++T
 koWf2Quo4s/2ufbJek/hHuCJVpVnf1oj0tA4H9dgz+iN6dHxIY/zeNBiWwB5B7Rbz+9TDPl148r
 ImkACU1/8veZyzXwU4ZKIpE/6lblNBccTvxxJ1OHXVWDL7Rv4HmGr2bSIqli1qVh4T/lVzm+MVf
 vhEQzfFrRMnXf1z4WFsf0RXk72Sfw06uYQRC4fwHF40GWGL1cs/dJY5RkZuKMP9VI6+j+q4opQk
 dL5A15BzTN3hD97Rsp0fO7jQezyZu9ufkXYfzYEDf+qV8PPwT7Ds5S9occ38b4aTDtVQSX+A/P/
 lN19+as5jyl7sdPr5K7fYamY7x0rIHxG3PdszLvjclWy6ZjGwYO8/xi8K2Lrhc6A7WXfjSmIS8Y
 c/ji0URlJYs3yVLTXKkxF/hyWx8vzaDMhDOHTKdFBREXLrg7JZS1Qx0M5DuvBfaIRt+hjuHE+iU
 ByEidRStcJ0OMy5iMBA==
X-Proofpoint-ORIG-GUID: qAn5SSoYur6rbH8Ol170eSxOmGPTmC-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 23:58:20, Nizat Mikayilli wrote:
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, but
> it still ships modem firmware, so the modem carveouts are kept. The
> modem itself is left disabled for now, so rmtfs_mem is dropped.
> 
> Described hardware: UFS storage, the microSD slot, USB 2.0 peripheral
> mode over the eUSB2 PHY with an NXP PTN3222 repeater, the
> bootloader-provided framebuffer console, power and volume keys, the
> book-cover switch, GPU, video decoder, ADSP with the internal audio path
> (four CS35L45 speaker amplifiers and the VA-macro digital microphones),
> and the WCN6855 with Wi-Fi on PCIe and Bluetooth on UART.
> 
> Tested on hardware: booted via U-Boot on top of linux-next
> next-20261002, with the default kernel command line (no
> clk_ignore_unused, pd_ignore_unused or regulator_ignore_unused).
> Verified: UFS storage enumeration, USB 2.0 gadget, framebuffer console,
> power and volume keys, the book-cover switch, CPU frequency scaling, GPU
> (firmware loads, render node present), video decoder (device opens),
> microSD (UHS-I SDR104, read/write and card detect), speaker playback and
> DMIC capture, Wi-Fi (ath11k probes and scans) and Bluetooth (firmware
> loads).
> 
> The display panel, touch, pen digitizer, cameras and battery/charging
> are not described here.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
