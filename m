Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707473932E0
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712580; cv=none; b=T3Fk47NA0DFeQ0jer+mRZlVv7FW38vGmyLbhgGA346s7Rmi9/FpgJApUwRMnc0jkH7a8ZqYfIIrtFYw4GWcC4GfYJACbSejyjnYJx9L6Fp9NxZmycAVs6EkyITCyarRpxM+PdC0S26v0H+Gp5Mb0/fiCwJU3I6tnwlA3F0H/zII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712580; c=relaxed/simple;
	bh=WYl64rUM3ad6FVdrebY8fHAtmJcINlmvNwd7TTqmiO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHgoTdsZwXn/p7xY+9qlNsV0qzwV+j3ZwXXCbpN80laEl0M9X3rrTS8LXbIi53awnw0YtIhi/WMgHcEn69MzDvY1OUXVTa60IS5DqqDsLSVmHSj2PaBlLIg2doZD/D9OwdzgT9Z0Wcm04GgLTFNrdEniJ2wmvmNlrgk/GGlWL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8SIJCGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA31fLI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8SIJCGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA31fLI9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NWYL1719672
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=; b=V8SIJCGAG8gjQeVs
	2wrcXgTGGOVNrLSI41ZybKQkq5KsUqwpoXzW8lQcj38eTmEiKLWo2U06HsYZTDRW
	USK2SyxOwAWLfXsX2b4LYtR/QBa/FqDvHiZU17+xbixG7NBNHuj3PVhh8xejVeNI
	4hqfkGzEGdzFVjFW94ihKRYBTKqc+zxcQKBk7TbZeQJOhK9cpPdXR30Xv5saQXv0
	SOAEM+5Mp9dl6HkDU7/02cSP1h0kM86dGDAg6zWv6MdQyuRuHtrBeqDu1ke5Pq+Y
	FmNVTMv8tz68yB3d3hpb+bg19TVqCSrS/oHgtSZ0TqPGaGe/LZSmWY1iAqEF1zHc
	umkehQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4ktb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so7401137eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782712577; x=1783317377; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=;
        b=ZA31fLI9XRn4QCgOCGzla3EVpGHznaHzMZYAxTRBFzXDcqVl+VpUMk4qFr4RHxwZUz
         NM+0wtwJbz9nUkTHJdXomEv6Ukw1sscsybh4ixzMvFFzGhZsDJZmZ8PDXi0spJfQ5tlh
         +zlV2g55qKlgtlPwsllHNCQgQUCWXLTSIKZOeSjSVFNetdjqKrEE75fH2B+p00bjrM98
         lq06eyEGoN2Us4I9PdHvK4RRTvptDYLBzhSzmfUxHZlkAG4BTa1hqPRrh/SzdglgtN7d
         4ZavrYvzigFeoG/Pr2KJObSQmKkY64PwPMmHQvui0Ma8Jmd1dTQxe/3nMmOwilhTHtMM
         TMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712577; x=1783317377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=;
        b=YxPSkbLKz5DjhEJzVLpPcP890A7HCAvYF6P/MJmx9TJwqf8colTihxNnYswH0n9hNY
         aOu0TQ0R84QOo5Ee/BJjeveUC3RPJ4rnYqlgxXgJQ9XNVLydu41Fr1y4HBMogubEzUlA
         9jCQ6Hv1HAKQt7yNjvXKk30gfVYqq8cnXDNYRbMgi5/z/ngajal4idHp80RxbfX3kQQK
         qDmC2ZNTgKc+6aO3yzNKAhe/Uagv6Z5AkXT7VsJS67kB2eiQsgsXc5Ru+ohcdQH+atBS
         a4iPCI6RFW1WHhRXMO0uqDRgAUsPqOZ46VVo8uSk89wHe/oF1evTZj+UKCkkzYMTwldP
         qDmw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7dX7s1Dp+Jb11F2DYM+bFQN5ZgGsgAJkcIr5N+9BRVvqTLOPrq8UstUyO17ul6k+6c+wmq0dv+k2D@vger.kernel.org
X-Gm-Message-State: AOJu0YxdnA7K9Cn0CljsZS/xi7ytqVR+Eqt+MBvnxuInYrWfPHTwXr+i
	u/hPtdj3xbdw9Gv+dudP+YofG7sGyOveK7YCTdtlfTPlJRowKzL2mhpOBo7BKhvD9aR5pPdpqdR
	fJsq6sKtmX4oN0MxBeFjG59P22tQKQB35b5fNeR2GNGeHZz0ur4BMO8AxGMzeuEgE
X-Gm-Gg: AfdE7cn5uCB0edVDzA8va+jNK3x1fecZfnp45mcTwoV/uhn6yNyNRTmnyDE2+pAzugX
	UHiCuXX3Ic4ZkpkIhbBR4ZmwvmbqpQFHLhWLslEkoh+cXAhYghEDkfvnhTK+sGWyqKmVdNnaNvV
	8V0qqCrL2O9Y0c1xyUUoskTNnlAptMuhnYTAyCDyek9poybTPU4lI7KnzswVpKCansU9O2oqIt8
	PZr96aft5hIipxQSgIPfB9DgDwZOjstjxbwrJKvSTpUe03cVhpUfkKqEebp3OXAqfZApE7k4Vkk
	s2S96gBLDLi15GKzWvf6L9SYP+egrJDZI0UubcUEhANByogUMfa5onGXfZmHKNc9/88JcNFPCOe
	7CyEB+k0sCSbND/tJFhc1w1R0GApS6MjnrA9tBZgPHBMrxh8fQl93oZDO4A==
X-Received: by 2002:a05:7300:caa:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30cab4d3fe1mr8008553eec.37.1782712576812;
        Sun, 28 Jun 2026 22:56:16 -0700 (PDT)
X-Received: by 2002:a05:7300:caa:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30cab4d3fe1mr8008519eec.37.1782712576246;
        Sun, 28 Jun 2026 22:56:16 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9d39e7besm34579579eec.26.2026.06.28.22.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:56:15 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:56:13 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
 <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfX7bYiolrIYxsS
 JPThldtfiZ6Ij7loPeCXiG1g1tyYz579FmHFuHVDfl16cKqDR27B4qZmEHNlfUI8pfFXVvaLN8n
 m5qsRcbizv3i0wXdExIp5mQOBg6jJ5A=
X-Proofpoint-GUID: mcDPdX4EgA5J9mH1XPGiXVTKAu4xk8cp
X-Proofpoint-ORIG-GUID: mcDPdX4EgA5J9mH1XPGiXVTKAu4xk8cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfX0IgImPja70Nj
 Rfeo6+woGvDmy7H7b0OWg/EwIgyB3/4qI2Ld0DoIa9NCZZaKNRSWUkyh6JFzsI5O4tKkuruolNb
 kHPeIr5b/0k40F4v8gK0mJzBLrgqp0Govk3XH5qA4ZnUT7FlrTzM8XQeMjL0O9EqgxpJYHjT7yE
 7m3vFHfbrIa0N/Al8bdUtiTPbRlDe0rdcxklby0e0Nt0cvW4YgLI+CI+WHt/mdunghXHBG4Ti82
 5bYr2Z3A8Gxm9LHvbs9bygGv1osSr+S4njaew91T8apAy5N/0U1U6QNl7k+lV7eW4hyOpDUPvyq
 WFl+/35PzKG+lK+oDO1gGcs3IQUXaB8rqA4L7FYzRYP8icWQA8iWoDi8m7+ZWsqzeMl2k1mLSw3
 fAlLaQh6cPn71mTCMz6opmiiKDqyy38RS180Afr+Qhd7airpqDJZuZOrlIXYngx7HamP3Ju27CT
 HEg9/R06dDRGPFE5F6g==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a420901 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=w56qM-ApfueYzBeFdjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290048

On Tue, Jun 16, 2026 at 04:05:43PM +0200, Konrad Dybcio wrote:
> On 5/29/26 9:02 AM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
> >> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> >>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> >>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> >>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> >>>>> under a single DT node, each requiring its own pipe clock registration and
> >>>>> DT resource mapping. The current helpers are tightly coupled to a single
> >>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
> >>>>>
> >>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
> >>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> >>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> >>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
> >>>>> with pipe clock names parameterised per instance.
> >>>>>
> >>>>> This is a preparatory step before adding multi-PHY support. No functional
> >>>>> change for existing platforms.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> >>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
> >>>>
> >>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> >>>> end up having too many single-platform, single-device specifics which
> >>>> don't apply to other platforms.
> >>>>
> >>>
> >>> I don't think that's really needed. This shared PHY concept is going to be
> >>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> >>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> >>> driver and may only end up keeping very minimal code in
> >>> 'phy-qcom-qmp-pcie-glymur'.
> >>
> >> Then splitting makes even more sense. Let's not clutter the existing
> >> driver with too many conditions and options.
> >>
> >>>
> >>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> >>> move the SoC specific 'cfg' structs into a separate file as that's what
> >>> occupying majority of the space.
> >>
> >> No, it's really the 'shared' part.
> >>
> > 
> > To confirm, are you okay with some code duplication between the new
> > Glymur-specific driver and phy-qcom-qmp-pcie driver.
> 
> That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 
>
I've already prototyped a separate Glymur driver, and it turned out better
than expected — there's actually not much duplication. The parts that do
overlap aren't fully identical either; they tend to diverge once the
Glymur-specific handling is factored in.

Currently, I meet an issue when tesing the patch, and will post it after
fixing the issue.

- Qiang Yu
