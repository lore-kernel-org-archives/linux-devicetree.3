Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC892DF13E
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052502; cv=none; b=B6eVxP8s7eQUh00W0fgOZ27HnQz8ttjhzfQ9xwC+XsMFnCA8g4TmOkfoD8aAIjDdYXQqf1C790Et2pTEojgbNBSlJWkFS3dK5N0s86uxUdLuuTS5cn5KqtImQq26+kIFYpV3EkV/So9FTQ3i1vwiUQZM4QYxA3Pji33Ekx7pIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052502; c=relaxed/simple;
	bh=QAYtrKg2irutF6Pjy2G3xild3uJP/F1Xc3pytIzhjQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwq2r9HSl9Py+zKY6qevqha+7vW4uoUcOofZGJOAPH5D5f+JomhANLO0pgT7EOkwdylYeTwrrhFlXWH/CpAfwi320TSNEUaX0pgAz9nMXsiGC7FeExfVvi70REeCCXabf5EdbmSdEn84i7YxHbzw0t2nDlJak9FeLwUIvr27GH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2W0koo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6g8GEUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2W0koo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6g8GEUc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AYMXA1579948
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 14:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=esWbFAdk9cx1HsvKCXdShNbf
	qTvcLQQigQNcNlylPKU=; b=l2W0koo+4HECjJF/Ke1KBW2tiBwE0texSKEoYkfj
	rkRmulgflREPFKrKWd5CkFyP/0Wqn36/hZRjJ/ucIv9qecE4wBZuHMJNn211DAMK
	bDRJOHXhsmSDkZioNgTWZ4LU+oakmE7BqfdSjhrTvuJoZn4vA59AOz2pJJTG76dS
	zaov8bzZ09W2B6yeIAU1iDecDvUZfvraaX4t7b6sWRp1lSGudvJsZwuRmJhGxtBz
	bdzFaCxMZobLcW0oOHZxAniBBywlNujHWyE+sBjvZ7wbxwLECnyrmy9Ryg+gt6a9
	f6u5dxEYMOyIrjoTFCcoH7ZOZdvGsWAYepJJ5Rw/+Q7gNw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2uxdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 14:08:19 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953c3b1081dso932572241.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052499; x=1775657299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esWbFAdk9cx1HsvKCXdShNbfqTvcLQQigQNcNlylPKU=;
        b=d6g8GEUcrzTgvuOqPq5s1dHnDCGLuR9fdURBgYwvT/ppcaTAv7kzcV12ZcY7+H8/uQ
         GzgNy6mokg6694koRsJ3TgjlqLEVZiRyG1Ef3AVkjwAsEOnJ44WvgdGvAlH3wv1GkD8J
         83NwZPXT4D9ccG+FwZ41Win4PsxfP8kB3BdCns4EkUrg6kWVbpvkML9/JKUd17p5keoF
         LsSf1uNhpcm4XvSYBqskA1QAYaT8dMhFri7PMA4/ukr3zU0KplIHcX3r2ICPPgANxAeu
         Ubic5d6RRMrh7lPyX3O2zxuPhrgRjQRzg/v3xK8sz5F4cCdqMvfdAjxEDExaj/aVznW6
         Answ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052499; x=1775657299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esWbFAdk9cx1HsvKCXdShNbfqTvcLQQigQNcNlylPKU=;
        b=mohqTl9Sxf5GpqhLFGSOZZflpCzFHCKbLjVo1aIyBv7zavYmq/rm1Yvllodfgz7Doz
         dg5dZTcvvL5NA7XLZoV4VSFCiRs73Z6f25PE8PPo8wzVqzn7aO0wDOmktHglnyBHBABL
         cuh/ZnZBxc40Z9FtGziX29hWphAT9tFBN0GGFtklsguMC9BKqgPJQlgqM4ysbgDPHw/w
         6reLtrlC+AHNa5Pgaw9/bFnRHX9xFHuD7PgPyXkxJzBTDEiHgsdy0GwA3001OcQ1Z/5P
         EYK10+rwJbf4785A5a8HBJBQVq5NRUoHLiz+qNhraJXUZPoaCBk3O8AbUosk2Uskm+uf
         ejQw==
X-Forwarded-Encrypted: i=1; AJvYcCXAF+Ppe4GClTCF4jVXsmvUj0uvRu+0Dn3OuLaODAL8DyirT4CQXq9yS8v9jmgsVLXS06ngK0dtn/cC@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkdZVPBeJre0Qo49DWc7T3tzuDUVxZKHPzthh633R7OyTZgRr
	PHU1hPfO3LdyKVY8T42fG3+vaeU587Fk8aNKHcWISIRfXpqheqZm6KsMbu4Bnl+/qemXILqZUhl
	39oXkZUPk/98QhlNe3vUT4yW+rJ3TNaKi/fxghCx93Jl55ZIknrJBw5hthNDWLdOE
X-Gm-Gg: ATEYQzyOlBGaz088s6JuxW/SpWw5QK2yHANtngwVhvVHCDcKqYKIzzOwdsLLtfAvJ+q
	KF1YXLpJOUbC+gMpNZrOstfUY1RinRzxX5LQ0Rquv/ZXZ3vtqWsbzGa4yKYSV6FTpisttfR4Ih7
	UoP6lU83jCLspTOkmPlpP/CMyQ+PgE07kIcOit+AdKyeG1pDj+Q/2w4d0IgkQjULUTFbo1t/g5G
	pPh0y9OFAEnhI2qOAILH0rQAGIH+fkgV9oSz3IA/LECEMw2uasIyfkzCK26XHtLmYlyQd5FQVu6
	0I5CciWf2wfINZhybGamJ1VRssL6MOI//STTXbPeyTqZL98ol0NuCrKFAGe37JsGzXlZwI8PFUX
	7+p88FiVBwyF16qCRkewkJ2S8QBdFmuzPmxj27nEakkhjIlPR0RSfLRSOziWEotw7Ian8z/sEYW
	hIQqctjqgu9khUpBAGHatRj5WEZdfKJJIsV74=
X-Received: by 2002:ac5:c0cc:0:b0:56a:7f37:d18f with SMTP id 71dfb90a1353d-56d8a7b7a21mr1169675e0c.3.1775052499225;
        Wed, 01 Apr 2026 07:08:19 -0700 (PDT)
X-Received: by 2002:ac5:c0cc:0:b0:56a:7f37:d18f with SMTP id 71dfb90a1353d-56d8a7b7a21mr1169635e0c.3.1775052498659;
        Wed, 01 Apr 2026 07:08:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f16asm3448824e87.55.2026.04.01.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:08:17 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:08:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <zbxzgonabk72p3rbgwo5qij3u6y6byioh66pkadnyl377ho4ev@uvwloygozmgh>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
 <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
 <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd26d4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=18sBtEtj7Mwma3VTVL4A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 5Z0pO5M1I0IFOCbTefNWE2rKxMxjJjHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMSBTYWx0ZWRfXw+sY/1HF0Evq
 9Y7R9bBUV+oF6ytbKME8WYz5RoCx3ep3hz6sqOcG5xFUboXZOKUYG98HUboKxCjp2IIdBigbvgT
 pxM1pd3aur+X/djRvSl9iU5VZz/KfZ6tnpFge+1IB5VZuLe0dlg0J0tScURbouLq3+s9AiIbvPe
 VYrTyyH6nIuk2zu4mZQm2c6LGmbtRZfwBJqdrPChd3VuimD3ccPJuNQwSD0Xieyf1AnAyVMAwm5
 r87OKP/ZEl3+ak335VQ9UwLNeoJdInPzPmVLZUL/5Kwy/JySfjbXIlZHc0/OqvKX0fOjTIUwJSe
 nRsfvbKMecJHiDP7YsGjQ+BwqC+IAdBwpcwuAYr1YDb363GyPdFq+d/mVu6hAcuxgp+GViJxdbv
 EoPoiK33VrfSg3+LsDPQ6yfYDor1Wk8GG+CRgjouofflzhjSL4xkiPbIMSkCuDV9MjXquspD5IM
 vl1bNcddkaRkOBClrZw==
X-Proofpoint-GUID: 5Z0pO5M1I0IFOCbTefNWE2rKxMxjJjHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010131

On Tue, Mar 31, 2026 at 02:59:12AM -0700, Qiang Yu wrote:
> On Tue, Mar 24, 2026 at 11:23:19PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> > > The third PCIe controller on Glymur SoC supports 8-lane operation via
> > > bifurcation of two PHYs (each requires separate power domian, resets and
> > > aux clk).
> > > 
> > > Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> > > clock ("phy_b_aux") required for 8-lane operation. Introduce new
> > > glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
> > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> > >  	.phy_status		= PHYSTATUS_4_20,
> > >  };
> > >  
> > > +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> > > +	.lanes = 8,
> > > +
> > > +	.offsets		= &qmp_pcie_offsets_v8_50,
> > > +
> > > +	.reset_list		= glymur_pciephy_reset_l,
> > > +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> > > +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> > > +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> > 
> > Just for my understanding. If it was not the NOCSR case and had to
> > program the registers, would we have needed to program anything in the
> > PCIe3B space?
> 
> The PCIe3B PHY registers need to be programmed.
> But we don't need to do it explicitly because there are also broadcast
> registers: writing to these registers will automatically write the same
> offset and value to both PHY ports simultaneously.

THanks.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> - Qiang Yu
> > 
> > > +	.vreg_list		= qmp_phy_vreg_l,
> > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > +
> > > +	.regs			= pciephy_v8_50_regs_layout,
> > > +
> > > +	.phy_status		= PHYSTATUS_4_20,
> > > +};
> > > +
> > >  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> > >  {
> > >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > >  	}, {
> > >  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> > >  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> > > +	}, {
> > > +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> > > +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
> > >  	}, {
> > >  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
> > >  		.data = &ipq6018_pciephy_cfg,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
