Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9D3F23A2
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974148; cv=none; b=Jz4BQK775H/MF7vXrsNZ9KhwSZ3KFyKOXxqGWH1CzfSewaBEiB6dOYZHYvcmNu1/e5oMsMtqjZkAzAC3De0CwDrZKrPOlKaDESsT13v5TwSyJIWGJ+AXwMor3oa3kfMl8MJxHkJtIcTAPVlLX57o4b+LjusEl54mWKHjDtbaHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974148; c=relaxed/simple;
	bh=Vo1i6u78HdYqI978QgAqscnNoozWLbIOBnxfjDfKqp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+gOoe6GZFCaQXoaK6FEXKGd+LsTQ3OrQp0KniXQdAIjc90/Bn0gBr1gO5RSiDqRfeJYAekl36owFgy0Pxa39GUo7xtxJKBug5406N1RrbUhvWWlKcL/jkcu919fG9D2/U+x2n4mEmkSNus+H+gJjJyrNCqSFo+nGOGgg8teXbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHQkpna+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCuY4wCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHQkpna+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCuY4wCN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vk3o298205
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=; b=MHQkpna+qodOr+Mp
	tyquD5PKaWGON31cG/1uUqINKyXCUiFUDRLF7+fBHdqwU1YETR5WnDmilF66iUh7
	u45JlvuNhY57I9T/gVmlZucDnazikH8A88Zi3i82HZEnfXpg2Ak71JdxFbdA1ugt
	oz1PspDIACg8PY8Fj1OXoXRIeQz6RGMOMfGJ1kmdVs2e5LLpmLhNpzqqPkwR0Lfb
	+PCWtU8uCFYDLbisOvU/hQtrioLpU3l0sHkJ5wJgLeocW3eSb+kN+iIx8UXwqCge
	H+WcFz2iDE+pNOZdBMeoCGyyV4bBnXC91mYvo/p7OEzRMRu+HIbrkGpVgpmQE6Hl
	oogW1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yaju01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:15:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso2204440eec.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974144; x=1780578944; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=;
        b=gCuY4wCNw9RcjGJHkolD2V/MFr1QMGQSx4un8FVb1CJDnpQjKa7tZ4T9NPyAQgel75
         6MJZ+eDB/u/lLA/HF2qekoFfEn7ZZABxqRNxsrSI7zX/JnI0qCsJZ9mh6N0OCoZd4BLy
         59PwjCHQo0gBzo3yZJEZ4ylPI5ApBL9JlRkncm3CgY8d4duVgOy6u2O1licEopAEL/vX
         OQHejvnX4mTrTLWmjyAn4BgeoiAk4Mrayn2YlKHWZHsJtJURLuXJ7R+4/n+Vnf6LVdJ+
         dlEStY2tsMKgL6nvkIoZwm4h22hbcq2CiMUxIGRZkDkEmT75X/H4YHGm55BlMDfFpZsI
         J6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974144; x=1780578944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr7DqnhWUk+VrPGKd9HD4o4Q1JTv5aQY1ZNREgd9xhQ=;
        b=qeZl0B/TMaYCf/vOs4EOUiq+9iCpyfXLrcytWARbhfh+wuq3hPA1VjcV6gcRNIX0Uu
         3s6k+AJ/CMn3slrABWZOhjx0EfK70rWw830R0sslxtq3Pb1JyNIFt4MkegjOtS4DHlBE
         7w8qC4kB+sUJ9tMAtJyD+bqa1pBarvttGQd8XAZMCz+XwyySekiFsIpU1lPNWOQ6VIyJ
         H4qIY36Klojn1/JnT9e8/UrINjdKmuSiKPblfVEOl1K4ecac6z5PP1MKEbomia27t5Ks
         bWofexJmtqPMaBSMvDok8dpsjulNbZj5EmE8quWx0kbcUwBtyOdkDKrwFeZUo+sHq/ZQ
         ngUw==
X-Forwarded-Encrypted: i=1; AFNElJ9HPo+qVyi53P4x5/J+MR1OcG/s5jl6ArGjX5hylJT5os/y3p4SEznC3hOF835f24kRL8fCDblWwDm/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Djq94rN5VVmZeOwoEYDjBqWePUs4x2RhiFUupSNWpnwjBE3e
	GGFRaThEbaR83hcJ4orC4I4EJ7cSpxNgdFs3Tntk86O3NCJLivTVT/xjnRCI1vxmRtS93gPtWUK
	zVPnpMoXGDpHe67YfK2L76ELy+htQb7ROZNYadLu4ZQ69mH7Pc+rpGzubIH/m4ass
X-Gm-Gg: Acq92OGANIo9etBqmgjmadrRu77dj5CqUHV79rmej3Lu7pmobYC22RSgS/EUw5Dn+dX
	YiQrnFLxVM9KrpQJZQLlLWEYxEPP/1NYoMcIU60iws32w6jm+bIBqQYkHNVBDYmnOK70mK6z65W
	jVGOezl50qGOD4/+Z/qI40lqQrM3qiAGRjNYBYwCvBL4YRFkjwxj0dvdrtH83HaM0sK3aUSvKLw
	fsiQ+mbqxggZDF1jYhUmV1QCqBSdKfbIegzq6/jIGPPl6Knj+T3b6G75evltqBkXeRkOTU0rZjp
	k10yL3iZR8J4yGphuKqq33B2aDpzbyuOyadvhwfDueflnOQXjUdGwp/bhGV1eNW2tj/t8wz55VR
	KP1OuJaiXijD0INd1EyYojgMFG18QcffY8TuYJFBvqRagEJXM4/vj0AjsQje3tVvBMo5W3OQ75a
	gDnZM=
X-Received: by 2002:a05:693c:8848:b0:304:59cc:aee8 with SMTP id 5a478bee46e88-30459ccb57emr7594268eec.18.1779974144403;
        Thu, 28 May 2026 06:15:44 -0700 (PDT)
X-Received: by 2002:a05:693c:8848:b0:304:59cc:aee8 with SMTP id 5a478bee46e88-30459ccb57emr7594241eec.18.1779974143736;
        Thu, 28 May 2026 06:15:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245fbeesm15786645eec.30.2026.05.28.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:15:43 -0700 (PDT)
Date: Thu, 28 May 2026 06:15:41 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ahg//RDP2dtleqBv@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
X-Proofpoint-GUID: barGlFxQiVQHQXzxzyUvbh4NTnjnUP5Q
X-Proofpoint-ORIG-GUID: barGlFxQiVQHQXzxzyUvbh4NTnjnUP5Q
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a184001 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HkNMFyVr_tcJnp_woqUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNCBTYWx0ZWRfX3PWXzj2LxeKK
 RlTewBOwYRD9xFV+L6txFnP2lNcDldgwNFWt5BV4Tf7VRgKky+TKHo4HtQlBddzRgaV8cLKgv7U
 SiNJZXwk1IBk8fwDFFaRSDeRPQ1aQ4XHT9cHVuZBl6e0JeG1kYeNWoNdnsaEHigwmDzGioFimYA
 rxCfHUfmK9oyPzWTTtYm3CsXS5iCi4u2Y42ncpjhWRdQW/a+HEfjhXXI2ylqlLhcY9GlVXcsbtQ
 nVQGIL8B3vDFxW+3jTLwuJtIn0Fu3diZFysUL6s2lWFQmnmcxsig0EOFY0q01/5Tq4+jk+0WWiJ
 eaVDcFHHmVZmaa0EiuFTzO0AwtaEw1rymdto6JQZy9K4iTVA9iXRM1GGkEF1h3mTcNYrx721qER
 IKJp3haZK6E39EjlXYbKcchb5p8kstqWhFOJP1O1gYzz9JMFNdAWXPMOHhQoxOzWAOIQEtIRKTC
 oIfe5x1+0pux+Z9vpSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280134

On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > under a single DT node, each requiring its own pipe clock registration and
> > > DT resource mapping. The current helpers are tightly coupled to a single
> > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > 
> > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > with pipe clock names parameterised per instance.
> > > 
> > > This is a preparatory step before adding multi-PHY support. No functional
> > > change for existing platforms.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > 
> > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > end up having too many single-platform, single-device specifics which
> > don't apply to other platforms.
> > 
> 
> I don't think that's really needed. This shared PHY concept is going to be
> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> driver and may only end up keeping very minimal code in
> 'phy-qcom-qmp-pcie-glymur'.
> 
> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> move the SoC specific 'cfg' structs into a separate file as that's what
> occupying majority of the space.
>
Can I move the SoC specific 'cfg' structs out of phy-qcom-qmp-pcie.c in
next version?

- Qiang Yu
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
