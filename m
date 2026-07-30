Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F03EF670
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403100; cv=none; b=pp5mWMpWcq74Wg0jtQOaqZjI+PVhITSqi2z2pfl7sd+KjKYhyVoEGq6FEiPyOSZWLHZ8vgKvAxPfGQhccBSHGhqbPerlteeEP0UAhbkJ1i0jYFtE3JWCcIF31+oAbTWcT1xiONWqMjz0Ffqna3tavM/X9syHopxsD/EfOdaXFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403100; c=relaxed/simple;
	bh=J3fl//mqSV8IcvXoBQv5UDQvckPuvtYXyIMtKx+eDVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nzuecrm9fGEzXTM9ZE/6Kwh0eHEeeSAye35ZP1YeSXm19OYUbokxzXlVrlQR5Lo6nhFj7+/cUw4WOxaMzFrz617YwVu5ZiyrQ+WFkP4TO2PYNTWZ5nvzlfJGXzlbb9JuHCgSdB0o9HsJAsoiCLSZCBDW6mWe9SBiyFbuH1IH0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCM0Lqgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUCNd2QM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCM0Lqgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUCNd2QM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9HNYL834524
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7D6CIAxG2VxuD/7lWVUh+sF
	Bcex9ieNa67C58ZvSVk=; b=LCM0Lqgo/VO/dh0bjt9RRFxsJInm3cQkhuUvlf8/
	i9NuLZu5lWLbCn9MCvhBsjqdZ+rK6aovyJFylIEYvT/j9pZ9kqNa7ofq44P/XTH2
	+9nu6bwd/3gFENAC9IGtt3ejxJCd3Iv+sktjlw3YVEwzqtOBQcuBzV+Dj3rWLxvd
	FgNH7B6W/uM4Hd6tS7St7sGK+Jijw4L3RVhbVBl7SYMOIKXrzB+EgOfvGX0HtxPH
	lSVCdHg4C0gxMIo5lC+aA06HYQjV2Y6rfuLgEWAinvJFCev/UQeFIwDG0FxMe6a+
	nJsQ+xguY6LLwYQ0VTjN6Rmv26rwladL0LwW4+5pVhxiSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3uqr04e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:18:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso50034075ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403097; x=1786007897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7D6CIAxG2VxuD/7lWVUh+sFBcex9ieNa67C58ZvSVk=;
        b=UUCNd2QMFrBt/+rFNvOK9JKDzJrde0RfCnlUa/S+cDRxQBUSC0zaMlUQg6t9vVPEfr
         VZ/BX46cCsfIWWtNFktnZA6S2kw8d1tze0Mt/d6JOtQqBamHHB7ID+hzcNEzImGZEbQp
         Qi/6ppumfmWtNTqvIGZU+ZVP977HWRijA/tiAUmp8l6ABCR3QBIrjcqNBF4z0lhEk9sM
         OFzqrgvTnstFRYO94CMmqeu5F7h8KfyktWwSNEhcITCrV3uLx0fCY29kCCE+hUvoDoyy
         s4AJ1s1WYQjoFG0KCOPx5TrzDI9CiEsa/OQ+BhvvyxikDZgChMR7ef/KAdq5gAdl9WD3
         eM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403097; x=1786007897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7D6CIAxG2VxuD/7lWVUh+sFBcex9ieNa67C58ZvSVk=;
        b=HLFmquIOrqBn7VL+IHE5sBPVe5S/2m3EN7ZJD16pZIor7VqzCz3scw/SSTA7Ia1muW
         8rTmSGMC/LYyOcbSSnOd9t4xc47L0NA+P5QrW0bdIUAq9r+TbtHGFMe8GlZgKeQb1tJm
         rl2c8Ej5bMbGL9HGzbIMWdReQh9Wzf2lgBWBg6uSsg9Ks0+BHRyMV2ewLjW/9ngb3TR9
         EbzSUSW5Vbzb8rgKBLnjB5EspLmygTpgBFP5i7yT/Zb59SYwtg8ryXECl4O/fiuHidW2
         M2QAnO/ZC8qed/WhsDGCilJD2azdrC2Thv65si2OVZ2sNCLMCmd6bcjQzPdjRwvghrvG
         fhKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSIONhciroB5qujFNei5RHBkLsPPUbR1Sr45Jlq97a+kqSTgGhZYHsO7BxhjGt2ULwN9EBoMFZpP+L@vger.kernel.org
X-Gm-Message-State: AOJu0YwapQv4fYJQKFuJS7r5Hhi4l8UUZKWRVBUdmDYV6YdWPoAzhK5l
	m3TYWnRhvCvaK+Gb6wwEciCqJFeuyFl+Qmpkb5VK5YR9HnIn3BJY3ujOmJ2Ib3wbXO/4NpDFVMT
	8HJDi6xMnZzLnrDcI9nL22Nt6FWQSpspafQTniODCz5DXHmfij/Xyg/Dv2su/hii8
X-Gm-Gg: AR+sD117RZv4bGAkcr26L9dmqrkd4Huta8O6YRdlXXBZnKhV2C7uFXw0yPax2sVJ3j1
	KL7nGh8q/dRpyoomjn4IfW/bInhD3/7hyqEpAkI3oZz0F+4I3ZiDYlOrItTUm8TAOx8qgMClofB
	iIbuwu4r+aEHETTh9ze1dskzX/1ZLBSvSbZLrL/N4epufST4+jwEreb7ipwHNeCM6HXqj1O2QwL
	q1/X+eQd+qAtrVbo/udkxW6QkHDhQxwY4KWoGywXs+eWBJ/XdcocmXT+M7aI+mGZMuB/f1Lsaqt
	aOZyBUQ3ZIOO2KtpTHlPkh3sLFwt0Ho2WWvWZTR+bnDY3UwUxa15WcKfFau5ENJkMF6NV2qU7kF
	tNLpPivUU83w+EBG93otI3Oi4jtW0PWqO+ZGqZ6a0N69I4RQ=
X-Received: by 2002:a17:902:ecc5:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d035be854cmr19138235ad.17.1785403096658;
        Thu, 30 Jul 2026 02:18:16 -0700 (PDT)
X-Received: by 2002:a17:902:ecc5:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d035be854cmr19137645ad.17.1785403095691;
        Thu, 30 Jul 2026 02:18:15 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d70sm23702795ad.39.2026.07.30.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:18:15 -0700 (PDT)
Date: Thu, 30 Jul 2026 02:18:12 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <amsW1Efw7vXDqLrw@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
 <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfX8bJP5A6Dywe+
 0nL3oODalGFjOTjJfgGu8JhOc4oDfYmPIhdNEg2fiK5HsTeFqXE/wNUsFVbUzMhXW/Pn39jtNgM
 L5wtvNn2XqArGgzRYF1khA4ZM1oOcrQ=
X-Proofpoint-GUID: eeZHA1S6HzbPcXyThG5CvfVArzmY_2lQ
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a6b16d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B5iJy24gySRdRLL-o9UA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: eeZHA1S6HzbPcXyThG5CvfVArzmY_2lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfXyRIZwFctuMdp
 zyNhvQjgMdagU9NNBoFNGMTQdzpfvsbhjKlGo5B2Dge4rkoqH/prMD6j4NrEWhBvfm32nQaOdfZ
 3jDbULhUmssIYwwrGH3rZ4qMPlzHktMWSzgdtMARgP75qJNrJkoQWPDOFZbp9MFLRzkJ+Uwptxs
 NIvGSHSk0Hw+FOxADyzijqo89Iu8l2+s8wCmCAoJSQmY0u8MNZSzwbJmc5LKZ6CEvXcS21isdvZ
 LQ/zahDLKjoFyS0RbnRKuzfzGMcOncGyIucw/aS2XxIBwCTxg9ZSRFYY65qLWLy8nu1etPZNSz1
 jrXIAlzPLdjqMusiET1XU8bTsRaDfVAEMCb3/NPPUBry9am87zMrKDW24d6nhk/ABR2VOlqmlss
 k/Vc5Usr1iZR05xnFEyxZajWm47ufBiQgxL6ww+g/cidxwBh2HMUI3VlzJJBClmLEtyDsBhZHpG
 r+25z69BJoB7LyOFX+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300068

On Mon, Jul 27, 2026 at 03:56:53PM +0200, Konrad Dybcio wrote:
> On 7/24/26 12:01 PM, Qiang Yu wrote:
> > Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> > x8 or x4+x4) selected via a TCSR register. The existing single-instance
> > QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> > DT node and instantiates exactly one PHY.
> > 
> > Add a dedicated driver for this class of PHY. Match data carries a
> > per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> > mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> > corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> > required by that link mode, registering the clock and #phy-cells = <1> phy
> > providers so consumers can address individual sub-PHYs by index.
> > 
> > The driver inherits the phy setting and link-mode programmed by firmware,
> > so only the no_csr reset is used and no phy setting tables are provided.
> > 
> > Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> > for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> > operate as a single x8 link.
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> This looks really good, couple of follow-up improvement suggestions
> 
> [...]
> 
> > +static const char * const glymur_pciephy_a_reg_l[] = {
> > +	"port_a",
> > +};
> > +
> > +static const char * const glymur_pciephy_b_reg_l[] = {
> > +	"port_b",
> > +};
> > +
> > +static const char * const glymur_pciephy_reg_l[] = {
> > +	"port_a", "port_b",
> > +};
> 
> I think we could construct these names at the call sites, with
> essentially something like
> 
> for (i = 0; i < qmp->num_ports; i++) {
> 	sprintf(buf, "port_%c\n", 'a' + i);
> }
> 
> (is that too cheesy?)
> 
> [...]
> 
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> This probably can stay non-sync
> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i;
> > +
> > +	for (i = cfg->num_pds - 1; i >= 0; i--)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> This should probably be _sync() as phy init/exit may be called in
> quick succession

I'd prefer to keep the async put here. The generic PHY core does the same
in phy_power_off() (phy_pm_runtime_put() -> pm_runtime_put()), and the
async behaviour is actually what helps the quick init/exit case: the
idle/suspend request queued by pm_runtime_put() gets cancelled by the
following pm_runtime_resume_and_get in rpm_resume() before the worker
runs, so the power domain doesn't actually toggle. With _sync() the exit
would drop the domain immediately and a closely following init would have
to power it back up again.

- Qiang Yu
> 
> [...]
> 
> > +static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
> > +				   int idx, struct clk_fixed_rate *fixed)
> > +{
> > +	struct clk_init_data init = { };
> > +	int ret;
> > +
> > +	ret = of_property_read_string_index(np, "clock-output-names", idx,
> > +					    &init.name);
> > +	if (ret) {
> > +		dev_err(dev, "%pOFn: No clock-output-names\n", np);
> > +		return ret;
> > +	}
> > +
> > +	init.ops = &clk_fixed_rate_ops;
> > +
> > +	if (!fixed->fixed_rate)
> > +		fixed->fixed_rate = 125000000;
> 
> I think this always happens to be true in this driver
> 
> [...]
> 
> > +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> > +	if (num_pipe_outputs < 0)
> > +		num_pipe_outputs = 1;
> 
> This can't happen (clock-output-names is required via bindings)
> 
> [...]
> 
> > +static int qmp_pcie_read_link_mode(struct device *dev, unsigned int *link_mode)
> > +{
> > +	struct regmap *map;
> > +	unsigned int args[1];
> > +	int ret;
> > +
> > +	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
> > +						   ARRAY_SIZE(args), args);
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	ret = regmap_read(map, args[0], link_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> ret = xxx()
> if (ret)
> 	return ret;
> 
> return 0;
> 
> can be collapsed to simply return regmap_read()
> 
> with or without all that,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
