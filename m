Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F573386559
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812278; cv=none; b=CfPjUbIgl19TekYj87WWeHbuH03MgSbGoAqh+IbgBMRkh+SB6NbrQ4TggFzBmrMkGgQbDffJByjIC5h9vqUblsXKjlnRtu9XTHk2gJCMP0qxjqWZb1HrrJE3j/uXMVlvaXhcafT2/rgM8eS6ClV50bxezRj3cdVNsYtOgJUzc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812278; c=relaxed/simple;
	bh=HOI0xlAGYy7l5QgfD46kgY9CHumk4KFjvm+/+5OcIyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCSmPX1EgyRtTdY/BFb9hnvCwyFAdj6Aob/fh7HJxjJHeLYSIg1ggnNWUC2ItU9SHUxXw4EQ7aukQDtnu4CI2Vl0gdA60FzMz9MOqsi9FLOjVjoXLBKUd1HwWRMCVOOrq1VGgWlLwNMCvFR2AkYRoNgrd9v+tXoSwMFVEqnwucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+Gf0iuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kbasu4OO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+Gf0iuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kbasu4OO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHhw1029910
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=; b=G+Gf0iuUl+YM7JIR
	cEzl2rOirYJX9ImhOf62a0uwEKgZVdgjMyRc4vszYOZKnfDYbPe7BrFcfjuV9rpq
	JZl41+GQOD9bcQBHeKEryHBRydPY9cUnG9nNJKAUNgreHCmhgbgbj4fYkrCT0czH
	8S4v9n2bnR1Jf1Gco5Ld3dWMA9MD9g9u1i45PrgtdPQzelZm2gAesQ1ZLjmBWSmP
	eI6lNeFjlvSlO8hd0qC3XPF6iHf+fXB8T+3yeYy19RlLdbuJkFfDT9nKe3Cky//3
	J5rcUbcSI8E7jqhD3iG28MTiSUIL1e5sOxUTBmuZcWscDOWzgga7ffuiU32N1eKg
	3ZZAPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4hpgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:37:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e56b2b350so481758785a.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812276; x=1783417076; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=;
        b=Kbasu4OO+4j9aIQzb8k15uTH7tD3rD453Utc930AHKWDDHO4xcXpNYDWkDRyuY/Xoh
         tUmTC+YR10a6tfX8XvUu4NFF7h5skQLfdw54WvaxlKRfuKjXJW2KWFF+fxnBIbQ3a1oF
         vWL5MFgAadnoiUQlIcf0BdR+9+uxKcLjOFUOGGmq8gsx5ykiKUttq9ce4F1/1xjuKrCX
         yKgelxGtnxvbJUT6Uoaom4s5hs0t5hE+o6vSYLuUVV/0vJjjdUwoSLutxHti4mu9NAHT
         ROraZFyrXn+xXWMFm9+1dw1r4O4H2qspEIcOcD4i2V/g0GgxO29+szQrP819b6azIQwI
         gKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812276; x=1783417076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=;
        b=aXBaobwsfSPldCQoaCtVwyAlW6m+lSYgEGCds8hv8i3zjBq6icho2BDpRlpFNvHPnC
         jY9znqzyMaqs1h9OJ+bsU/iC8ZFFri5ga1/BsiuP+RCH8yJgH892J1UNLszCtg4f9dqh
         VfCetfjgIjbB+IHQSHdObaGy2R/ZyVxVHs7aJrCrVHCpqpz0lMFnvmdbye6E4tIZTmxw
         5gvq0zSm9kVBxs5nY1nb9tAev9Ty1Q3KPio/D42ABVTQnULS0FlsmCge3+0/oCx0psPw
         HLlh3eV5SeTkjQ5BZinf1HYwZWCN1ARH30NynERlv5obhndzzAbbIvm4Kl1AAjbctp3N
         IZxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4tuwzh4yRAqqt9EznOSQnVEmNyhwIj3CC2xwxfM+aPPHDC/vTVUgKzdGkqVBOFFfCnY2xvbM7oLAq@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDEV4yAn/HIrcsnfJwCSamEmyi9XJSPviUtHHdPz4PA4bsFhk
	MmaiibPI+qs1dTCet5CQtJWLgZ8DX3LJEWhjnTjB0+O+Y6yIR7eeF9EvsFP23zQQWLxtpMB+9Q9
	Po39SNKUSPz9Nb//i/UsW4m8XsIYvm/R99OPIBXhtyOJCKGInotd4YxQ+BDeIQ2vC8V9gV3Dt
X-Gm-Gg: AfdE7ckDV8gcDvcS+vkxKMFloa+OYE/2NRkaaz6HJ+oqYhJt2Pg5ozq31wB5b8DG2ia
	R06GoBvgckMEX9rtr9/rOGOYOR7W4ETRzEbWaRsrPLSKaNXgPuZsAywf0+GW9TYX+rhwmBIVRbF
	+pKYvlt+BTlcczN/n4cZqo/L7K3LFwjJvCXd5kGqZzq1/L8AN8/b6EYJRCbojndPDuy21fkIxOD
	BTLrncDgt/R3sKdvLWIGcs2BZH28DeLyIYC9djIx28BTG5I2NKPRneLNaRUm8yLbvRa0yrese/p
	OeZ72R7TZgdkCfz8ts8+UXYwgXWk2gf8Aj3ze9ODSZb5VTEGIiw3A2CS0R3pcRXOpfnuuo9Ou24
	NqdoaTPNl5/jpYT4Pc8DEaoGiAyHDd/2L/kteyihQi2I/+sS0OypzWJQ/buDYpe+zn3+bNJ1UEA
	==
X-Received: by 2002:a05:620a:4412:b0:92b:a326:3bdc with SMTP id af79cd13be357-92e624ccfadmr452299985a.20.1782812275678;
        Tue, 30 Jun 2026 02:37:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:a326:3bdc with SMTP id af79cd13be357-92e624ccfadmr452297585a.20.1782812275232;
        Tue, 30 Jun 2026 02:37:55 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e7fe3sm199003685a.27.2026.06.30.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:37:54 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:37:49 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <akOObU-nX0cDEhrd@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
 <20260630072606.E55491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630072606.E55491F000E9@smtp.kernel.org>
X-Proofpoint-GUID: xAv2iUjEC1_oBOJtQFAyNqPzrS5k1Ruo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NSBTYWx0ZWRfX2olGOM2e44nk
 IR+xb5xuYHkAJnxgIzzW4v/esCvqUqOqYOvx7YALic+93042Kr1XYefj97inqTZLesrKSBpFQCa
 Ojq1YJh5knyi0rElDoejPkqDKB5GuTY=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a438e74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=8wtVhhPeGe0wYdhAELwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: xAv2iUjEC1_oBOJtQFAyNqPzrS5k1Ruo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NSBTYWx0ZWRfX+sCYStzkV1mR
 l4rg1BId935rqXe/Lln9cDA7Mt2GmWoyq13W6BIVBhNpLNMJmdaccaCFywQDppH3fJaF0QATHjf
 gf4uoSM3vMe7F3VkdFa9cFsdsRQnNtuTWzjWKz1UAAo4oSgNzWA5nMLE2hAzhenZVr6zHWoFYXk
 HBDXgo+JZql1yRpYIiqh7bPgYptQ3o1XPgPa42mBq31+bcVEWg3Q15t6Fnvp8u9eUkKL92BeW5Z
 CxRZJ6TD6eK7SFGapOvTbhOA4sZwxTZ3HYh7pkgmBBWV3ABlldk+DzHakQYnITJhRRTrUIkmLMs
 g7jE8loEFuMPDOcjjVi6dlu8HMMHiZRYykWEvLyutKkhqPq8I7eG8iiK5hTVCmecXYMc/i6jSvy
 Tfx74et74IxiIoBvSBvVcJhTi6VhJSAZLZ1RbtSkiFLZiBFW2JwiUAFk5t1AqnoVso8GMMBrAxK
 SVvzDJlLIEaQHrvI8gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300085

On Tue, Jun 30, 2026 at 07:26:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unused PCIe controllers (pcie4, pcie5, pcie6a) are left enabled in the ComE carrier board, causing boot delays and power waste.
> --
> 
> commit 5654913fbfd858b8d2bf4684318b0d7145c8a5b6
> Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add base HAMOA-IOT-COME board
> 
> This commit adds the device tree for the HAMOA-IOT-COME platform, which
> consists of a SoM mounted on a carrier board. It includes initial support
> for components like UART, Regulators, USB, PCIe, Pinctrl, and UFS.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> > new file mode 100644
> > index 0000000000000..99c47cd953b83
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> [ ... ]
> > +&pcie3_port0 {
> > +	vpcie12v-supply = <&vreg_pcie_12v>;
> > +	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > +	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
> > +
> > +	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> > +};
> 
> [Severity: Medium]
> The included hamoa-iot-som.dtsi enables pcie4, pcie5, and pcie6a with
> status = "okay", but this carrier board does not disable them or provide
> the required reset-gpios routing.
> 
> Will this result in the pcie-qcom driver powering on their PHYs and timing
> out during link training?
> 
> It appears dw_pcie_wait_for_link() will loop and time out after 900ms per
> controller without a connected device or toggled reset signal. This causes
> boot delays of nearly 2.7 seconds and leaves unused PHYs powered on.
> 
> Should these unused controllers be explicitly disabled here with
> status = "disabled"?

Yes, Hamoa COMe does not include NVMe, Bluetooth, or Wi‑Fi,
So I think PCIe 4.0, 5.0, and 6.0 are not required. try to explicitly disabled in
DT is a way
 
Thanks,
Yuanjie


> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com?part=2
