Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9031B828
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465512; cv=none; b=Q7psuY9Ao8saWXAseEYLDa/9+L/Dul4V8macrFJZ16kendDF60BL9iHtzsglcDlDZrqjoJaNK+UgtqmV75ekbX3tR7Kdux83DdFUAz83gnVZCLJoCgIZqpNJ+MTxWB24YUFy/UOUQV6Hc53tuYBVgfJBhakbvQVLR3RWoNN1Zuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465512; c=relaxed/simple;
	bh=XoVYvK4j2mNj/m5Xl1S/ADv1s/wHFU2q++5San9uGco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqinjLmz533wWWF0/jjO8DihxXozfTvHCfxC+S/JATTfm3VY/fAMFuKGcyS9B4myij7dFMMxp3Da/eXbJLvnFqVoX3TC9GMFIoaVnurs+JZRD5cfYe1+JReYpVZZo0bgDfAT4Wb4AkdB6w62VPeBYqQxARy+P2pRbNUKI77jvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDpdsDIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GueiK6Bv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDpdsDIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GueiK6Bv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFikBO1816091
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iATiVmYLy6QOISxyuOhwGtct
	bsWP38JfVMmRM7nScI8=; b=MDpdsDIL+WGByIDskDtDCdGbXL2zNXLHSfmLMVdT
	gSH2HZ69xGLtvx9GwyyMABdsulGKR+R/EB2u8/MmbY2YFRTfEGk0Em8sJ1SM78yZ
	r2hSkQnPTJFsBGkUPFGLW+/f5ZSrkuCI3mkuLKxZZCmDtYcUmCm21trY5mvFOtT+
	e8Vh6v5RXvrZ62W9Jj98e2/6Wk3eVoYAsbT5oF7TIhrYSlxXPu6ZX84HwlghpYJ+
	7shVB6Z3kDyhVGjZZ9clxFK4fTMwsvqHxqkImcp9GZJk+a2wo3yuRzfRcg587Fob
	i9ma1FTEl+IqIhKtFSmjDCEAk0MUBZN8wNwoajunVCeoYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm2ryb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:58:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3962735a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779465507; x=1780070307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iATiVmYLy6QOISxyuOhwGtctbsWP38JfVMmRM7nScI8=;
        b=GueiK6BvcGPD3HADihGRZvdzBOL/bVbKseWv1TGdn/1uk8fH85p2tF1CUTjQ8ki9kQ
         WO4mm9YvdwmVraKAryWWmgNCYZBI2pe5k2z8NamjHg37DYDt6Kh0GREQLCYri9NBufNA
         30RPWKiYqMr0uM9yJzEnn2HmJlonOpCekzftaIF8GxR0h6gjkMW5yhST6MNbflNvtItz
         LVN/lICUjkA6HOWjkgA0zuf6FvkqrkT2WShTFUxBU2rVhfa3k3+meC+xN7XCSb/paTxk
         OfJVCsXBoFSACMqvPVdzgx0beaPDMFZf80aXeLcQdAWFMir1VKoTsM1CiwTZ86fwZpe6
         eliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465507; x=1780070307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iATiVmYLy6QOISxyuOhwGtctbsWP38JfVMmRM7nScI8=;
        b=R1+tn6MvUc5Lr3IV4BE4LkyQ5td7QlDRfFOG9Dg6iWetp3xqmqd1lPK+CBoVWuvn4E
         laWf3MXPomHqQXEZ+UGgP46JBguaJRiCITij3otU0p4nmxm8vcfzkVRLfyK/ET7Ykg3b
         CvYxupNMalilVd+ZEXJ51X+qde5iobH+e4n+KnvVyECEQEHMdkQ7pdC0pkeiM+v2lPZD
         YlXHans4zgrRl89ur4/RFPdaoATAd3KLsaiEwL9qakYTP9G5MbDyfW12vww5i3Ra5obQ
         bslFFQDBPEeXmtyyZkDvbEyJ6jPMENkuQ1uo5rdHeHGTuhWuHlOWJhNSbFMMUzfJXXI5
         4qlw==
X-Forwarded-Encrypted: i=1; AFNElJ9JLKhE6ev/PWFp3Qt4eenwhpqHvaZDaJhdwOZnugrBHCc1tVDIVbPSyqKVgv+cj9qI6/34e7wA3PZO@vger.kernel.org
X-Gm-Message-State: AOJu0YzepuNxNnpg5CyvcXmV2x8kOvDIjYIvjOcIamCEjJFPlC2co9aF
	99uPiDeFJr+gjWE+yOPiYcPb9xN8/hjw5KM7ONuACacIJgI50sDgJ6apiWdL1Z2awGw7ClQC1y5
	KU+PEhnw82fiBTZfJZNbXSXZ1k4UGfzqfXGO1FAXVMe+Zqh8n6qkwqUl5pBrPLANI
X-Gm-Gg: Acq92OGq073XEWaoqvs99MrW/8tFeWyAp+EKhhjtWlP7T86JQSX1Q6hcsnTPGsW5f5L
	b5HYz+EsS9zz9xRPtzGl6xFmYxj84N4DskRlXUUatvnAjNvxo+ItZp+11i/QnpKT6uRBspDH5CN
	DBeWigNKOMJGtylBCQD9tagyTm+8QnIEshHiewUKKYjebCrb/tskojTDkQcXCGTAwS62bb0ck8r
	MxrK+FTEWtIi8/12vpTehq1zeqN+D4pBd5NGY42D/k/b/Gjm1Z0Sx2kWwulDeb5LhpvcVXUzd12
	rcDuD5acz6TNU7/+8CFTJ0PSZQ1xZOHP/ux0iMY++iheoPEaEtmOHVI00yXcGx9NRx97VCQs4K8
	VCOSXmpnD+kh3kCVzJBim2dsEh7137gxl/2ECr0nnbH8bcBqg
X-Received: by 2002:a05:6a20:394b:b0:3b2:b1e9:f1f2 with SMTP id adf61e73a8af0-3b3294cb409mr3564745637.4.1779465506623;
        Fri, 22 May 2026 08:58:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:394b:b0:3b2:b1e9:f1f2 with SMTP id adf61e73a8af0-3b3294cb409mr3564697637.4.1779465505970;
        Fri, 22 May 2026 08:58:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm2579650b3a.41.2026.05.22.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:58:25 -0700 (PDT)
Date: Fri, 22 May 2026 21:28:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260522155819.y6r3zgjkyeso4zpv@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
 <1f8f46c7-8332-44ee-992e-0b9ca1c0ffef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f8f46c7-8332-44ee-992e-0b9ca1c0ffef@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rrxU_gPb75fvLt6JHyI9sOB0mKyMPohF
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a107d23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9xwycFMNzIvhgBqj4zYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1OCBTYWx0ZWRfX7W6y0Qc0Ou/G
 pbd2PBYH8NnnTbP+yOK7+b2d8h1fFMtQLoiOmHFeJdJsvSnLCIkNcjCSKSSkic9IGVVu3uLsBR9
 QFKp9ITkv53r0qmk/d7cZ1p0ApqwrItxPzZcmXi/M8U5UE/mSBDKS+OB9G6+Ff9GM7Lod3WE3AI
 tiM52N+mJ+azvkElqKHV7ors5M2T/4nbqYHqClN1A5QywBG2zlg7Oekeo0qsps7hkeLpcy1Z1KM
 vEakYUaGTyPBwgWDliRfxeQFDrCZQ07bBEOyjFTga7XAAOtSoRpGEC2j8rHvzVeHU1nJ5Cy99MM
 xm0n8xMtSKqFtS/bN+uKZZjMk6vQgSdu2IcEgQFQKD9iz7yhYhnJwsO0nTU1cw8cRwxBmvdOiHU
 U+j8E/FsDnPH8gnQ1jzQHPYmRY7kyZbEFSB9FweLM/Z7e4xCTZj83jEsdmD349tOBVW+BZWGCot
 lgzt9SUHpgYrmRQWTdw==
X-Proofpoint-GUID: rrxU_gPb75fvLt6JHyI9sOB0mKyMPohF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220158

On Thu, May 21, 2026 at 12:21:03PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram' phandle on the SCM DT node.
> > If the property is absent the feature is silently disabled, keeping
> > existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > accepted; an invalid value is rejected with -EINVAL. Changing the
> > destination while minidump mode is already active updates SRAM immediately.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
> > +{
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *sram_np;
> > +	struct resource res;
> > +	int ret;
> > +
> > +	if (!of_property_present(np, "sram"))
> > +		return 0;
> 
> I think of_parse_phandle() calls this indirectly already
>

Right, will remove and turn below return statement to return 0.

> > +
> > +	sram_np = of_parse_phandle(np, "sram", 0);
> > +	if (!sram_np)
> > +		return -EINVAL;
> > +
> > +	ret = of_address_to_resource(sram_np, 0, &res);
> > +	of_node_put(sram_np);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (resource_size(&res) < sizeof(u32)) {
> > +		dev_err(dev, "minidump SRAM region too small\n");
> > +		return -EINVAL;
> 
> I don't know if this is possible in practice
> 

Right, will remove it.


> Konrad

-- 
-Mukesh Ojha
