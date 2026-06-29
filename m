Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1D368D7A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735779; cv=none; b=MLpKGAd2nG75bFNU613ZycwtGoB5Nb+oB+/JQELvTWD7tHbG1nulIPCFqQ0ABNhNaphZgT5m4LcRK0eAzHNRQ9fu+iL6a0Uw0dkmwna4648Zqh0uY4UuIeY8q9kScrIGVsM2yQS9bKIhRtgrQgUSXxeGNy/9qvhqBGoljDjAiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735779; c=relaxed/simple;
	bh=d3kPTL/o27f36RL21IlbpjGa5HabCtkaGY34Tq9vSME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG0QPBTmc7evTbqqSYnsp9albvNJ36MKIKE5P00PIvoBfBcHE4Hxg02oL08E+0+7fXmOhOU0/COJYkrC7bNWybpKAGxcMtWkvAWStrHs9NuiLydl2R7gGKv6FCYSr22LBTC8Bvblb2PlpZXJJuOqkkDvAr80HhlFswh+UG611H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGoh1VNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4cLbmqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGoh1VNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4cLbmqI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATeXt2648345
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=; b=mGoh1VNUjtunSpcq
	aupOluZVCgr4BMkiDhf9UpZfGr2UDY3sGaTFquzTtcWOTADh0izwOjaPB965Wzj4
	Lth05W5zPkDK5Io8zldPkBpQEF6GaHEfUeD3q4GTHL7M0W1MvVNES8Hiwe56z8Zx
	VPpBytw5lOZtFlNjn1X7edka/pTzyhGGszhdxTgJZNd8m/oi5gsrFmhfh092EeC6
	JWtDvZ0CI+9eAuG4pKdYIo8xrVwIVtm+iLB3IhrebCJSzxnjPbTJg0NM8CoWFbGV
	eZermrH+fLyhXCyouby5DItMabRrIInMBE63EUiTyS+f04nTDGX9XZFwAlh0YYv4
	uDdO1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh7vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:22:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3774296eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735776; x=1783340576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=;
        b=g4cLbmqIuj/qoXPrUyukt7qGyvIlm4teMLlDxe5g+fOTtBwS21An4HyQQlGupxaEU7
         PlMBMkTzSrdR0DpejhG132sDI6mahNykXOiUIvKxz57z6WZ8936aPaA2pl2BBGJ0mxjf
         JStKRem6jnpTRYmJNbgm3yIA+V1xFulwE9jCdRhFefP9YJvoW7aVvodESFjscMApm/YY
         Ieue6bpRIKsNi4yAJhAUu4JK+OxlRMclX06as+lJfErZPyYyWcrL5RsgwnIbC8u/u8KO
         x9yKnYuKXxG1VMqL1JA1/iPrxB4cGtUgIs3/p2QfT5Gmvbg05MavzAL1nGC6iPuwhwS3
         7WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735776; x=1783340576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=;
        b=GHzno+EMpsG6eBpXzq2FMad30a3cMmq/x91fuUSgDoIYkQL38J1i2W+ER2//bisKqF
         hJWqL1qR78wXFbeVyUujvviYLK8LhdbQLeiEQWbbzyXwCN6OEMEOqJxKnBWGzyafMryH
         3eLzuCoysrjSr3PWShb14JTXrScDMoQkoK1mZf76QfiTd4uRjlUGPSzyBpwJXTVfSNen
         4RThBP9WyClJL52T5D2KpS/rlqFj81v7CT1fqWbqEaUiqD5x0arqDNtCYJXMYo0QEKBx
         hHfmWzZxPFvhBcCjVrQGTOHu9oV4IvWOBFw+L0s4pOUcEP0Q1bxPJZmIE66AcgfxGa/p
         0SdA==
X-Forwarded-Encrypted: i=1; AHgh+RpB97cNn5hPWMtWwf90mK+8GdAAnUKXh+c5sFtg+HCQVDtHo2Mzfgg1YQmNe6t4ig7cocq+t6tnn2v2@vger.kernel.org
X-Gm-Message-State: AOJu0YzsC10EKKg4J3lNFAVHWGhiaeFIy0pFwi6Yp1AKw06H/r9Cvo+E
	F4e/ecdrEAQfVh6YklI1MP3OvNVvxixxMHVDtzN7Xea0AgCMC94hKa0U2rfISBuRrRs5uY1Le5w
	qQwXlHAPxo5y2STW453iYaM+lVZySyMbLE1FU7B74zgxry4TBFFQNYioHd8f0dya4ojKHfgMp
X-Gm-Gg: AfdE7ckT3GVrbZipxJvJtlIN/6a34DuGMscBX113JI+qHSlSi6bg+HxngnH3+0gpj3M
	Y0G1yf0UxsA7sD3b5v39xP0ssymU8kFd/RL0LZaN03bHzXzqRi2QRG0j1WUwU3WW80DEeCHVbnk
	e4ybJ9sGkNMONGYdl7+6fjlhedoqNASUhtjv7sXoOtiPJ9v+hG1uXTcXv/ek1LKDBLfal4v7X42
	FPCqqI7JNYBG+uA/3F+MA3iosmMrICeS8gb3F/fSFqB1BMDA8tPjdAP0lorFIPUcWdmcpM+ulFr
	ac76JlQ8Y9ufrjo88enW8YBvrTCJnVDQlUP1W8zp2c137yeYjFswiFWcX/nYbMCqCI+cALf6eup
	CTi/J9RXoF7JsT0DvZ3RUp/MAZil+kaMukq7GVA==
X-Received: by 2002:a05:7300:818d:b0:304:e587:5063 with SMTP id 5a478bee46e88-30edd1f0caemr273082eec.12.1782735775635;
        Mon, 29 Jun 2026 05:22:55 -0700 (PDT)
X-Received: by 2002:a05:7300:818d:b0:304:e587:5063 with SMTP id 5a478bee46e88-30edd1f0caemr273068eec.12.1782735774959;
        Mon, 29 Jun 2026 05:22:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm43647598eec.9.2026.06.29.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:22:54 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:52:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
X-Proofpoint-GUID: DN7uV-tJhQQD39OjJ0B_eDXRqSn_6BO7
X-Proofpoint-ORIG-GUID: DN7uV-tJhQQD39OjJ0B_eDXRqSn_6BO7
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4263a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=enEazo_1d4iZabAa-cIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX11dcRZjajmQJ
 Lpmt6LnBPI0sVWHJEQBemCdEUM9x7oU5CQzozkPqSsxiS3/NPBqVD8FpUwSERkEdvsj9gOWL1pH
 rnbFunAU32w+ApSSraK/sbjt38a4F/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX8iFurVAl+sjR
 CSFZB2spDWx6z22a3YhYpmQk43VtGBWW6D08pwZkEUW6PkrCrAFJW0pbDsix24ReBRaGFp5UM8Q
 vL5AIqongKd8RQ9d4cOfiF24Nf/saPCtb8Of14Pz8zKl7A8XUwMjV6PK5s7ao973sYkKuK0x+Cc
 7VzT3PF7kAbxUf7asPGJNdwSp+oiYNL+pe2qhnP0MXnjNaO4JT5JjaJt8ZxBXglMW+Q4K15lotL
 zUzupHz2paIBC6nrTDknkQtjGiV9C0V6OvtJVumIyRpUmeoTFE1u3ZONytELdIAIGeLi8pTryHR
 cQwATiAj0KPV8ilx3HO+M2cM9Q+eeDH3rNf2v26pzHKeN18bB5VW0VNKmpj6Ink92ebhGGrnM4o
 PUomFYs8h2+Hl14wd7nlQBJwsS6s+uFpkwjw7JROqy5b+Ah84gM5eX4bYWwOlPX7YIC5g5dLpr0
 CsH3j4glQozniJPvcHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101

On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> > 
> > 
> > On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >> All the existing variants Kodiak boards are using Gunyah hypervisor
> >> which means that, so far, Linux-based OS could only boot in EL1 on those
> >> devices.  However, it is possible for us to boot Linux at EL2 on these
> >> devices [1].
> 
> [...]
> 
> > Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> > I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> 
> Is there a good reason non-chrome devices never defined that region in
> the first place?

This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
control, maps it for WPSS during boot up while Linux at EL2 needs
to map it for WPSS in Gunyah's absence.

> 
> My guess-understanding is that UEFI allocates a region for it on
> Qualcomm platforms already, and if unspecified, we reserve memory
> again, wherever the allocator decides to
> 
> is that roughly right?
> 
> Konrad

-- 
-Mukesh Ojha
