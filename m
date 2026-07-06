Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9AD3815DF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344525; cv=none; b=KdDbqLUmQJC3Q0CM5yD09H8SHaa2lCBF2tC5OIUwJq1CxzkUneIqnB2E6LXYskN3On85UGg6mlokH38ra3szSrOv4Xm33ErGWGjniJhlWaVigeF5e1tczr2g1V5P9dUVtzj1H6Us7rKFldEyrPV9A8F2UlYh352jA5inXQRnn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344525; c=relaxed/simple;
	bh=aeuaeWBxBFIr4Q2r1Pi1YsBsyu67CD4Zmp52h51ilWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eka4lSuI42hpgM010yN1ZL7uA7OC66RDECQ3Qi3q8AsiLpGV8CyUxsclA3dqP5vJu4oOwLUOP+HPrml7pbU31FunF+RhyfsRxJASelvcmqwdJX0p7q+ij05ye+CsWLiEJIc+O8w3E8Y5NRR03D29d8f8uiCM+lK37Jk46IFXnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IG1dJhQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZWnK8dL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IG1dJhQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZWnK8dL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJHu316469
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F4YzPvkIFafrsTQeecRSVEE3
	uDq8Tr9d6kglclfX8Qc=; b=IG1dJhQ2TK1lZoqXxDBTZiA7WcNFplkT0ifrIvey
	REBKNB+1aTtd6BL6LsV9wdDjL8qgV89vpH16GQLHAqmPJnfeLEIy9XeHlqNcPWWJ
	oME0IbkU8hJOxP5YoBeZTu6IdU8bWvCX3NHFkb+X8EnCuql1NuAxMkfe+FD9Shsi
	C375zzzMq1XIxbkKxqV+rfmGw9nhM+6ZNwKClwVUBFYKx5bH2PZgiq7QlvBLHo1k
	7LxSst3uI+FBXZpOpm3MlMhNmmCsTSckok0vrwBGcir2X4eRvTzJscTa41pWaMI/
	DwN60N0CdgW3F2CbamteCsjfWzNJynl6ue8gtZsquHw/Lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hf58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:28:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so3005257a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344520; x=1783949320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4YzPvkIFafrsTQeecRSVEE3uDq8Tr9d6kglclfX8Qc=;
        b=AZWnK8dL7qokZK394cLzo+bSiq+ON6wIkLYevQ3E+6zVAVu/upH9tfGarrC6b51O/Q
         2NeVm0tgQF2wiCB1rm0PWS7E9JoOlv+jGKKeMXkNv99Vlv9sCgqGCk4EtwVEACz5IQze
         h5xPk05sioQ3tcCjw17AJ46IREv9XrGUBp9tEIS9oz52XxeYCMU5JQCAFmE94LsVcSCj
         qqP0Fkn1ml2ArTsRfqfABZ6r/nNUhA82pg2v0Ol5pOz6k6zAiNjgc6GZ9PpS+fS0SmYU
         lM3mROu+wLi3ijC8G90S1wHkNOkvxy86LT9eerFDeegNnzFYKPowbaJYuI4xhB7mnvKl
         CwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344520; x=1783949320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4YzPvkIFafrsTQeecRSVEE3uDq8Tr9d6kglclfX8Qc=;
        b=ni8O5f5oTjTDnKMerAyU3TnJfVtRRLoLWH8R/erQuMQdIkCiSf8hTaC+31u4eN6nKv
         7MtBXRcM9My/KWU+mxse0c7zgsdLVEvRjoDXDZFAfGmkT7F29liRQ9OMFYKdms44WG2y
         N7CgJLgNFzdUKpQgcqcKYj6x90tEMGdyIEhlSqHgDI1XSFscsyqh/F1VI+rXacenBiYz
         b2wHP+izhuTXunmJv9pQWcuv2MGJvS3+AmaoK1X2xIhkbcqM/tJN67dlsCp9SBmmORzc
         UL+kEpUFNez92IgGKPY132vRIAnOKcFVS8JuTEBpNGCrOwjgQkZZcpqdDtJOeQFbl5wq
         LRhg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7wNugzhbG5vngcjrd0utJzLPmSulR3RxmJFewUd0vksOEzx+5bzCX8/+UUOwfNN0bg3m4OfQCpuML@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58z8u6Xdf/7sWOckmozCJ98AhrrJgnsa4EmPibal0e1aYw+aY
	mCXnAebMJUzBfO9zauUxfOuHDXXxa/f3JjmxUl3s8sECBMFwslCBK5gqimaxpBvmAbbrf7g55gc
	AJKwM6pW4semHWWi6aVRRhzcPcJzKlTc9PGdtleCdVkaBrEsnN6pvpNusxXL2U4a8
X-Gm-Gg: AfdE7cl77TOBNPy+4JX2jQs7CQScVGsQkvQLGdSMi73/v5Pld1XizFXjXD1AUw9Vyuw
	W3f7/s8ByRkIIO0cqBURgEp6ymhif9/CtgmOV4NCYRzmaoEL6H591GbP8okHSFCLd5nhztmW8DY
	iVDuyfqy1JQaHdr1uXXOyoH1xBH1/oqcV0ls6MBI+75Wi3WGadNkteoLlKYq5N8l8MrCoQ7EiG6
	b7ogNUF+vA+zFNcZiAWtKj94fT9CGunfzKECMaU4mX6foPBQxh7T2eci79o1oLer33xMayLkamr
	qO7+D2I3Agbnd3TDgyeqQAdqCAXobfdGWL3QN/VWMGPmDV2tOXxDB5Dem5bgbO62UE6Bg75WkO0
	b2QlY3O9lOO2tlt2TVD1XQ/92/f8JGd5oLpwXI0vMDsMSFsH1pOcUVXxtSg==
X-Received: by 2002:a17:90b:33c2:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-3873e06e1d7mr573777a91.12.1783344519619;
        Mon, 06 Jul 2026 06:28:39 -0700 (PDT)
X-Received: by 2002:a17:90b:33c2:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-3873e06e1d7mr573749a91.12.1783344519098;
        Mon, 06 Jul 2026 06:28:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c3a92dsm5135980a91.7.2026.07.06.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:28:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 06:28:36 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <akuthPV9qS72Y8an@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
 <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX7S8TRrNl6RDQ
 uRpLYWzlZu1v+ER3tJaRxQEwa3hUsCFlKVNxYkr/FWmnOzDNClFtvbFrQDAadA5QCnT5kIcgs+G
 COu+ySoGOTJEjkDlSj4OUM+WsofrT9f5+os4N7CsoH3N1FIxwAYU4P6nahsyPRjp73nYNy7N2Fs
 dZ7YLjeXyY1Q7wla3mcnCFEpKkcFddqYTAbtLGy1fY0iPxAV56pDLOz3L6hPfSc9iHXVl7kQdi1
 tVv72x0OAFc50uJx8E3l33IGB616086NyOaUxazrADrOfd2MHd8NrXjuyQddP2xU4gw7v1B72LA
 /PTMZMKzYj5VIXMwfFv/6oAflsDltVtAWHS2ftHi2nHwklbd1WGgG0vPkxqiDPeIsVtQhMIlbWQ
 DsHLHdwiaVD1wZqILNeLf8kaSZMHLVIzblsKad2mZs2MI0WvCk2p1LAAtofEBx4/6jblVvPsX1r
 umDZYlXJby7F5QJzLHQ==
X-Proofpoint-ORIG-GUID: F4yKcYne7enQ9rNTmLyO8CN_ljZ2by3N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX3Nl4MVlau+fK
 2A0gHfCE/jKNS6O8Z1rd/6fVRLL51SepIx4D/mGX+H4u9IySFEgZQbOqA8W6gERyzouwoIPUL6T
 ZtB2L8YIxg/nPF5FSuCDzvc+4WFYc74=
X-Proofpoint-GUID: F4yKcYne7enQ9rNTmLyO8CN_ljZ2by3N
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bad88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uIdvwDQCYy_p0Y3DDrwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137

On Mon, Jul 06, 2026 at 02:47:40PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:36 AM, Qiang Yu wrote:
> > Mahua is based on Glymur but uses a different QREF topology, requiring
> > distinct regulator lists and clock descriptors for its PCIe clock
> > references.
> > 
> > Add mahua-specific regulator arrays and clk descriptor table, and use
> > match_data to select the correct descriptor table per compatible string at
> > probe time.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> > +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> > +	},
> > +	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (PCIe4) OK
> 
> > +		.name = "tcsr_pcie_2_clkref_en",
> > +		.offset = 0x4c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> > +	},
> > +	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (PCIe3) OK
> 
> > +		.name = "tcsr_pcie_3_clkref_en",
> > +		.offset = 0x54,
> > +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> > +	},
> > +	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> [!] (PCIe6) This needs +RPT2 +RX2 -RX1

Correct, will fix it in v8. I thought PCIe4 PHY and PCIe6 PHY use same
QREF.

- Qiang Yu
> 
> > +		.name = "tcsr_pcie_4_clkref_en",
> > +		.offset = 0x58,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> > +	},
> > +	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (USB_HS) OK
> 
> > +		.name = "tcsr_usb2_1_clkref_en",
> > +		.offset = 0x6c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP0_HS) OK
> 
> > +		.name = "tcsr_usb2_2_clkref_en",
> > +		.offset = 0x70,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP1_HS) OK
> 
> > +		.name = "tcsr_usb2_3_clkref_en",
> > +		.offset = 0x74,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> ("USB2_2") OK> +		.name = "tcsr_usb2_4_clkref_en",
> > +		.offset = 0x88,
> > +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> > +	},
> > +	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP0_SS) OK> +		.name = "tcsr_usb3_0_clkref_en",
> > +		.offset = 0x64,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> (MP1_SS) OK
> 
> > +		.name = "tcsr_usb3_1_clkref_en",
> > +		.offset = 0x68,
> > +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> > +	},
> > +	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> > +		.name = "tcsr_usb4_1_clkref_en",
> > +		.offset = 0x44,
> > +	},
> > +	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 
> OK
> 
> Konrad
