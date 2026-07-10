Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D91531E8
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649972; cv=none; b=cXZHtr/nw3vPEl7beaOEty+X7p5Birsmit/oEUgiwPFUpvN6J58ZIn0DLQyCw/brFZzJrNV/0PVtTsBQrvw9jMCf/KftqNtEf3vu4DiaxbiFxVULJptmgqvhyWeBj4fIwQ5wFXY3hfioPTn/e6WBUmCwTxItlz2tLZSKQ9bP640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649972; c=relaxed/simple;
	bh=dTOvkTrvE6CGY556iIU40hm7Hjr3+MgiKgj8hRpCJPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaU0HP3556TBd5E9532WRn33EsnEgX38HcOrRPCO1/OdlDiEVp1gBD/QJFAiV/ta3HJ43FryhOzXQofex1GsbbS96DqPO+1h0qjk8yocGq1OMbeo8WvWt07NW2ZlQdOj4rwxf7DyeWQXq/d9ebHBmG2DT1vzplzBX3bwxBndQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRf3QpFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw7Y955y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRf3QpFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kw7Y955y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXWwY2519642
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zdXv9NQmLrQmjmpGUVK8uh4
	ptN22Hc7QiFgP9f/iyM=; b=YRf3QpFSOsnm9mEqyEOC8pJ7obSk4AdFpK02BzTn
	wlvgOuOVoZe9HuC4U1gAd83JyVQMZGUN7Nv6OnOSUwJTnawJiWjTUAXHcVGG1rUi
	/mrXWi1cnHi3ovw8Ihonn9T/cVxQ7iHns92k4Qu3CmykZTPluJkXWny9vLLcmjyA
	8BGS2BqK7/cpxsGogJfp4XRktjDM3vsTbFBl5LAnMOSZHyqjQe/zaROVOkOQlCwo
	5sdgEbjvhFVuo4TiOlr4aXTSfNm6GY7EkAqT/o5+xXbVkSw6pGI+wfLMpBX97zCS
	6763F6V7xim+AwUH4umo4mALnxvWCDuiw7wIDQAtPl+AaQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekna9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:19:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso684481a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783649967; x=1784254767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zdXv9NQmLrQmjmpGUVK8uh4ptN22Hc7QiFgP9f/iyM=;
        b=Kw7Y955yHtvZHq32kOeLfIZC3drgvhR0/eb48pnGOOEhIBUTrhTZxGdG3Dg50yOqfn
         IqubefC+aaVmPbZuuiWdeFuP7ACTZJ6ZaCVr5Apuxl9+Hf2fDmg+zohElAUEmcwHr6HP
         21qL+C83OOcmr6aYltVsMFEofqK8+nMHSn7bUSnzPTDoCFfmzHWI9XHwo1sBzlvIFX8B
         Evx35qTlEV69MJI3sNuRayuVwTvE1sQymTLqQt75FKDs6POAxXISt3XGxnkXeeR7qBRx
         auFY7fBdS3dIHeY/1R4mv8Ndm/5iYYAgSZjxbpMEBYRZzX4mZvB+Cq4l83QWDqVpuAwM
         OqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649967; x=1784254767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zdXv9NQmLrQmjmpGUVK8uh4ptN22Hc7QiFgP9f/iyM=;
        b=GeBjuTeBos2bgzY1IY//nX3HtatzxW29Y5C3js2KWXWYujCyzw70DgKSninu9Oxp5m
         Gdw2YLpWJdV3fZOrYoH7glw+/oKxR3XOHSMYa3R6KDBTGESCbONg0o7ffr8NePjRX6Dy
         d0UJCKjvTCdLy4mfUg5j3xiWms+mjTNT7VB2yX3TVnoNK3PRe4/tFtXuyloxarEzQxES
         HUkP5n1LGkJwoopEGoZxKVq3+oJHOyn1HiunapfLpyJn/D3hkfc9Ia6PM41emH4UUnth
         vc3w2IhW3Zh91wntr3VM4kAopIWbztGVWcd1PR8GTYgdq9MjhvDG6xc9OHnR+EOXixVH
         WM0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqdtx7PHe6lT9zrv4hcRlIMOfNMOus51OwOclkrcpF/DAtp+e8DYbm1uqwF5FV49OQjhoG7L/GE36Ui@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpIBqeBJv/xhrLinxHzdDaAoUHbR3XdFqD027gLNuPa4S3NGo
	Y1WIb6rCwIwyC7Bt2DfiBHyAAG+drtS/g+b9hdlQycVPZsj6SYPzOevD9pBvSU3nRF/ZpbHmbVZ
	P0Kp7KX2F5Knd0WtEY8FQbIRELzmNR12I/cD1fKKRpNpM9UJaRbBYjxhdqgZ2H8+3
X-Gm-Gg: AfdE7cluJhK1Rezss2ZhJIFUblr8rh/5xFmL/Wtz05QM9VlhBaW/fBxYxDnBqFPMCQE
	BqYZeFMrmYRoUBV9C0Truplgtv/4Kj7zK4S23wuntvH/ooZ9uMv3cgMHVe7aGSHXyfBQHPrOsw0
	92vcCt5JH6/Leh6aS53W5TXBvtHGvuK9U8rpGS60vqbS5J+VdnWOWryvFqTWN97xdwvKNDTHcTc
	pf2w5tNzoOcBwmqQz9BkVuFS5/L58csSHqAcA+2tbG8s2r8AYB7A8mQoHREDPoomxQcKYxc2tCb
	i9yT9F53BWbpn6r7oNQ3r79HIZPhopRcOe4CSE3s/vCXzldFFhSqa78lhSO3IztMuwg2kpDB1q+
	B3EGFCI4UxGWGI/TpB+dnNuh/DW1U2MWXAbz/gkYn8ZgR5o2MBoknluwWLA==
X-Received: by 2002:a05:6a20:cfa8:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c0bd1588e8mr10223135637.51.1783649967316;
        Thu, 09 Jul 2026 19:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c0bd1588e8mr10223105637.51.1783649966771;
        Thu, 09 Jul 2026 19:19:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm13596455eec.22.2026.07.09.19.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:19:26 -0700 (PDT)
Date: Thu, 9 Jul 2026 19:19:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAxOSBTYWx0ZWRfX/kIcn5yTwets
 xEeyz0/E1/qrrXfDikAkR6HpQSQxBUVxT+SQ7cdlp/HM8LwUIPqu8raKPKx/sylrQvDVlrTQaJy
 USb/z5TvT2vyA9AsBl1vnjm6XrrM/j4=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a5056b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rieQvRA5rQoxJvxsdQgA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ZHizdVfuxdgCKOHmlwsqw3GXbk0ZfMwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAxOSBTYWx0ZWRfX4/UOvyvnhSoa
 H47BLLVzZuTmsDjS5fstPAfHPK1quPgHShmHsJZTauBOFT1WvmfTovMRLrIyVUXl6qq2x/PxaKG
 Ksh9EmL3Jm9GoUaqocGygC/0TwqQCan3zXPEeXLVKqLi7fU854NlxMnsDQk6uQbPglltmIjr5Yr
 usxiKzV4K8ysRVSFL5Nxu/m23vl290MPr878qoapydM1GV3U1Wm65vSelQOeD9z8q9NoblThiod
 wD1PcxRNGDs2cEjwzIGAebC5vEUEztfVLHSm4nxWSwixi+XB2kvS2yXwHob6N58RugbXFJRuUNt
 x9Qa3LEH2fZteLi+nApbyySgzG8uUZl8JivSJmKM0WEIEyGimKMrt60vIEFt/fRJH8GlEiY0tnv
 jhKHNzf9JuV5Etg4YJwR73+OzMgmWtCDRVv1pJ7dzmOpxOTA/xT729e8miZuOBZIhYAJiTIGQQ/
 yOY8hxDB96dfU7JNRJw==
X-Proofpoint-ORIG-GUID: ZHizdVfuxdgCKOHmlwsqw3GXbk0ZfMwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100019

On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
> On 6/29/26 7:05 AM, Qiang Yu wrote:
> > On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> >> On 5/19/26 7:47 AM, Qiang Yu wrote:
> >>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> >>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> >>> nodes.
> >>>
> >>> Update the DTS wiring to:
> >>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> >>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >>>   &pcie3_phy using two-cell PHY arguments
> >>> - configure the shared PHY node with link-mode and dual pipe outputs
> >>>
> >>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		pcie3a: pci@1c10000 {
> >>> +			device_type = "pci";
> >>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> >>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> >>> +			      <0x0 0x70000000 0x0 0xf20>,
> >>> +			      <0x0 0x70000f40 0x0 0xa8>,
> >>> +			      <0x0 0x70001000 0x0 0x4000>,
> >>> +			      <0x0 0x70100000 0x0 0x100000>,
> >>> +			      <0x0 0x01c13000 0x0 0x1000>;
> >>> +			reg-names = "parf",
> >>> +				    "dbi",
> >>> +				    "elbi",
> >>> +				    "atu",
> >>> +				    "config",
> >>> +				    "mhi";
> >>> +			#address-cells = <3>;
> >>> +			#size-cells = <2>;
> >>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> >>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> >>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> >>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> >>> +
> >>> +			bus-range = <0 0xff>;
> >>> +
> >>> +			dma-coherent;
> >>> +
> >>> +			linux,pci-domain = <3>;
> >>> +			num-lanes = <8>;
> >>
> >> Is it fine to keep num-lanes 8 here even for configurations with
> >> bifurcated PHY?
> >>
> >> I would assume so, given essentially this is a x8 host, whose 4
> >> lanes may simply be effectively NC 
> >>
> > Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> > never enabled at the same time. When PCIe3a is exposed, it is always in an
> > x8 slot. But if we have a x4+x4 platform in future, we can simply override
> > num-lanes to 4 in the board.dts.
> 
> My question is whether that will be necessary - if yes, sure, we
> can do it, but if not, we can conclude on this early and not have
> to fight over it in a couple months
>
I think we do need to override it in that case. If both PCIe3a and PCIe3b
are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
will see an 8-lane slot. If an x8-capable EP is connected to that slot,
both ends will advertise x8 support, but the link is up at x4. That looks
like a genuine bug from the user's point of view.

- Qiang Yu
