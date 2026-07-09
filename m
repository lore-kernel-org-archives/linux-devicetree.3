Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF03FAE14
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599082; cv=none; b=BrkKCQzAIoXF1z5FRURDlDbpWDFa0Rq3YDo4Drne9kHUmkUDsbbjaZKXk3194Uix5KsvSqz2CgWbpwMgoPopasbo7P1F6hbKvJUOwOepy5UeA3poSD9IL2TS58SsofvTy9vQ4N25KUZvULrv+Q5jAmmZN6BTaXGTVaVlQfLTDv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599082; c=relaxed/simple;
	bh=IaoKShWdnjsuH9prVEQZP2sLwIKjqPYh31jwNnuIJMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEynBq3+bJi4/EFw6nUjUa2AtrRzUacjFJaRfbRLcocLGW3pPn0jGZAgqotCVTcLhTwMDID4vGCN9vEfq5xszrHXH1yBWlsi/E7v6jIooHo5vhkwJMsAOI043Dwx/1noeapSRTOOLg8rvLzjF6X2S1tyY5i1mmzMJb5L5ZYmXo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idW/ioHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/8RoDVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idW/ioHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/8RoDVH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDH61628455
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=; b=idW/ioHXatBgs8z8
	XOOLVikmCVNpX8LgKweO8n7vNzAwyIoozWRdYKbsdKtLldrk+1+zs27CT36qJJJq
	SD+bl1HsC6xLbrNgGD1uqAtUhoIKljL5hAOjNPb33O+W33NL32c6D1OE+A0NGIaG
	/q8dIUldZyfPexFyjPu9Kffm5tC86+Udxh9+fma3n+BK2/vIdDTtGOV4HW0RK6YK
	okUe/EkBN5EGiuDG9PUklHVoOHuZmpbu/6bxe+tRuez1a2K3QEfg2c3mf0Wuy4M0
	LaA0avLFzPNSku4+huQ4+qyrqJrwWFCGwJ2mlpNtq9NEsqJp3j+T+kA35aPh6CE/
	uFGKRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuhkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:11:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso1247477a91.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783599078; x=1784203878; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=;
        b=Q/8RoDVHUhL7KTqwtvazkP0eIsyqyN1AN2FAweQUXicxjQJTIHUE0b2VReQvbsM51S
         PmFAbg+htGeXUkryV7xhTIiPkXGpos9uVkH2YF+Cd9L+SFnH7b0ae1uCTvw6MPfkNx8g
         7eGkxQLIx8KpxUtrjJsJKDLf3bplWYdmte2keBxBE2rzcJ1G4CAVcbiTd2bK6s2WSL7d
         L5oQ9Kj1mr2Inakef7Z/i7AV0Tyab0Wn6C/plRGcxAeiBfS+Z/99Oi6zf26rSs9S887a
         qb0EGJl6OyoLp3aawnfWudTBBreQqpTrsaG7ExyLJ1c1yU6nfOMBpFnD9OFxsMw940uO
         /WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599078; x=1784203878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=;
        b=LJ0fgUQenRQXwFdnXmYLy6wwygQocE5wUwEegMXmqAqkbI81LpJv0FKqOZYytU0W5l
         Hcu7cS4waESn1PjRnHFVPfYvy5WkjDH6XMmHByNFtahgLnidblDWjv47+vsTzxwbrPM2
         SX1SE5oXAmIcXcrjtxfPAj1Qq+ZlW+fM8q1PUvu0JhUzhNi8SwTxhpeuVwIbnn9nVDxM
         vz/fjWhBBIIBQcvAYHMJBoUrdt07oOogYnvQRar4KjkgD/BXI5HgBcmzaXLrVbjoWDis
         UXYhHLjcKSlD+//bSA8eBqchYu3kI4/Egye30wcdzhmovH9vDcJB1RYPIprn6QF3b4Mr
         jmQg==
X-Forwarded-Encrypted: i=1; AHgh+RrUVRQ8cANQ+gkH0GGG2jsmpB7O1yXl0wmFHdx6SbCnju0KFEUXUV+oNAR7oIZQtV8NhWefooo3IrYl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2VNBDSxVqm6rZnwWzvGfTf8xb3zSOpCP7760MF627eTxjUX7
	W7Sd/pkII4i9Q85Sku5hkSz3RVU0zMNjV7z6e6VXASOkDBxN3cN3xhU9tyEnmSKcv3U3LcOpcfr
	c1nvMIzxMN8cilWeC7sIj5Ur9EmqQzwXxzGViYJIKJ2Aj6OXk0ff5GKk57IskHB6PMIMGJ9ud
X-Gm-Gg: AfdE7ckXVE8I8oJ6L9lBuMCk8weYUEVmxr5rj80t5IleNirNTzUaKiybWQ31DzZrPuI
	FD6UY6qPIT8RcaeizJr6uXIT5UasCrte2Ig1cDqNVhKEtK4+EAhrFjS5bcofBp9pGN6entsn0II
	FytoWZi8GVGWqt6LG8W7yhIUzwe5Hn0JaZNHJZBdacakVenOCXLmYtLyzCVcQ+XRMpZAmA5fYkg
	6tbxo815+eHi1WuULaoON/gJpyVv1gDfN/FQ0KS3U469j/KbreaD9XATnYVd7jtf3AhBF8iFpW8
	REB6jLQSSW5vWPq6SWGuwfifuD89g2gJLO9zvyAZKc3aLObLTNlEb9MsrceH2LrYMGZUbPrM/Wf
	FtK6RGg7G7voLcIUf3lNoaG18U5aBkFhFFo9aB+c8KJtvAovlWjDNHqustfhW
X-Received: by 2002:a17:90b:5808:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-3898f6c4f4dmr6639283a91.34.1783599078451;
        Thu, 09 Jul 2026 05:11:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-3898f6c4f4dmr6639219a91.34.1783599077759;
        Thu, 09 Jul 2026 05:11:17 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm31876262eec.16.2026.07.09.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:11:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:11:15 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <ak-P4-oWqCSV03M-@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707102536.0055F1F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNyBTYWx0ZWRfX31nG+1s+47M8
 pJu14H9N71GaP4Nd7mjAJMSlGbacApKqRWjrihHAJjpkBsAguusc3PxYCCzWzx10KUOWgw+r/zN
 E5aFGitzxkPVMp911r4jEowMAgzfhlY=
X-Proofpoint-GUID: UIKQhQpepy16aBiapy3oqz1bD5sljajD
X-Proofpoint-ORIG-GUID: UIKQhQpepy16aBiapy3oqz1bD5sljajD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNyBTYWx0ZWRfX5FA9hcgLKCm5
 0wHTtOdjHE1m0gmky9DyQTbS0QA3ru2e7up61KmFe8a1f3NCfLyIxlyU0Yjex6+sVj+NOYPMp1a
 wuDfi2dWN5NdAlyuYQ0uQ5s9QNWYnSrsLmLuBIUDqDkoWYFPG638jZNoDRV9TtmpOUIWN16MqF2
 ejrE4sC9Zwji5SaOqj1heuNHUfk9YN1YQHTTQdCrqsqfKJgVOzOuRaVteAh2VaQ7S6kJmKApf7P
 3jeoNRrVqmr2c/9qeuY4yrxZjJOBKJP28n9EhKlA1Jj10q/JfUdP71QzNLWgbDYH7j9E9DxWKm0
 Gu0PcurEkyqJOsBOxvTRLXrjUAOYId9PL9LHMQH0BiQBaNcVRc0ddwjxVRsmHUpNIpFKdMIV8+C
 HBklCWr2P4ITqD+ILeOp7Dxjt42LHbgHbrVEKAZIBDZZMOIL2kEaE7vTbSrNXn3RGTJL4l+7Cka
 qNXgZuv8cTWJvnuTkiQ==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f8fe7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a-Rp_Dgs8Qh9DFuD1R0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090117

On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The 'qcom,glymur-soccp-pas' compatible string incorrectly falls back to 'qcom,kaanapali-soccp-pas', which lacks required TrustZone memory configuration.
> - [Medium] The `remoteproc_soccp` node is missing `status = "disabled";` in the base SoC `.dtsi` file.
> --
> 
> --- Patch [3]: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur ---
> commit ba22e521690a1cf89042171dd1def802f653ee49
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> arm64: dts: qcom: add SoCCP DT node for Glymur
> 
> This commit adds the device tree nodes required to enable the SoC Control
> Processor (SoCCP) on Qualcomm Glymur/Mahua SoCs.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [ ... ]
> 
> > +		remoteproc_soccp: remoteproc@d00000 {
> 
> [Severity: Medium]
> Should this remoteproc node include status = "disabled"?

status = "disabled" was dropped as per suggestion from Konrad in v3.

> Any board including glymur.dtsi that does not actively use the SoCCP or
> provide firmware for it will default to status = "okay". The driver will
> attempt to load firmware and boot the remoteproc, potentially causing
> spurious driver probe errors and kernel log pollution.
> 
> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> [Severity: High]
> Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?
>
> If an older kernel lacking the Glymur-specific match binds to this node via
> the fallback, it will use the kaanapali_soccp_resource which does not set
> .needs_tzmem = true.
> 
> Since Glymur requires TrustZone memory configuration to prevent faults, the
> Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> SMMU or TrustZone panic during remote processor boot.
> 
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;

If the binding falls back to qcom,kaanapali-soccp-pas, SoCCP SSR will be broken,
but the other concerns are not applicable. And as per the current bindings, not
adding this fallback will break dtbs_check. We will address this problem in the
next re-spin.

> 
> [ ... ]
> 
> --g 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3
