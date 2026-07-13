Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E0356749
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922077; cv=none; b=Se7/2eeOo4sldFcQIpIXhpiSaQaf4XJ0DC17ekZg472k/jbusYxNaXwooiGsknfVaLPPe7zwc3x8c1UMuSsChrIJ2JZe+MulF4ecEL/70whvK9RY5ZVwuyx7b+JxeyMnm3l+UWb4QiIHJCGGc4KB9zBsa4EhbDBbl5dBMilapeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922077; c=relaxed/simple;
	bh=DMfDlT9bsxrHyKP8oYQv8QAbSpLFgAnmglqR+FPPdqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF0hSE8qiWDgmK6TrLuTmTkqPi0idV18Ce6ICO9Dt09KPKdN0DRHkEjT6PY23GRi9mpWDyHyWdi40Nb9UqWij882AbA9sf7kiMtbGe/pI7c3SlOfX1wvkl9E1Pux5bu0JXo/a5e/2l0TyuTrdYHb+nk4peMHQQwnph3i3vU6goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCEZ4Vf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO8TmxdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWCEZ4Vf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO8TmxdF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39x7O038553
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWufmJLmZffuA40T+VuvgB28
	WuhjcxcWicXobvilNRw=; b=eWCEZ4Vf3MGZRo6gKK5uuoi7ontXh0VoCZ1YwpFd
	UkS7S4qwVbHbYMoik14MeOUrBBgoShxqAHHIppdYvYFSpVrxCrJ+l3DlmiP/cOZw
	JGpBRWfPUTqp4/hb1IV6gJ991VmaapF6xbM/x3AWUA2/CmNvS9WE0G/sTD9yuCgC
	g1mQ0Xqe1UhXCE07gk2f4DxRrEkaeBfKBR0iAs2tMDd7F6RrhSTD6mPdcWD1pcqj
	LNwPyauRNRFrov2Fkb/vlJcuiriGtgAiUUG5rqcrCvfYb5sfUxk0FAWVIhgrNoN3
	Wzh12vuUlAZ40c++Xs9ITk7714/CIL6UpN1uaxAj1zjm0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mjp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:54:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso6458714a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922074; x=1784526874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=FO8TmxdFx20jcGmMBed5l449yFYLqlRnsJAahUBlYCMUJaRDCxunUt3VIDkNIKxKfC
         DbUrOCspBnfI8dKH9wAX1eVLLeevn+Tp3wNmZg1QE5o+rWlP4brLINhg9+B6MymLhOtw
         jspwWxZn6mQiYFK3INH27W1wy3FM1IC89+6aKcxgAhuzN35XfleWzJJZQmV0Nqc/LQH5
         NAvSVptT4pRKviN+x8C6NUVFH2iRWmz6UJ8BsQQRKJRZd3An/gomdkisQMB8FJi06osb
         aHGywqfE1x5XAI6/uiFqWOK2ZRKX2aVRZnyJ81bKqmUytAw7VXbLGe6+V93Ryf1TtNsP
         6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922074; x=1784526874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=Q4EbpNIXRqAkJM0sSdAnastmzZ7gQqxfax2qnw28J+Xh/5S5kfPLajRa6wXxwi61Ml
         M7+qEs3CKjwFGrSAfwBwsfkZVZkwqkBU0Q5ngxsI3uhvo51jOj0s2bmjSS9Ta3myucKS
         99/fy55IZCiXDyTN5mQbsglGGyWvrfugL8fJXi/EeCqb+95rP6s/2a7/273QazuG5BbW
         X1rhYxYqDvzWsm0tgVWOl9338/8u+TG3IylHqN97T4VTSAXzUTacM6InmZRsobuApGD1
         MgD2iEX65JPab2tsWW9KQeP8ZWpRzWNSJyk9Tu4w39WUGkl6TGkkNdEqU62JclERngXc
         9JRA==
X-Forwarded-Encrypted: i=1; AHgh+Rou7rm7VgIpdoDrF9o0iMJoAh8vONr6fQIOj+EIcYDZ+OlkR0fgpFPV5cNh9+FyE5UcBxaLdHU9S1fe@vger.kernel.org
X-Gm-Message-State: AOJu0YwYA4eTKjMqANydq7FFWlu9G4pwKVveo02pS7trDfNyQlEm6sLR
	2yfhsG5mKARl8G9TVRa/0q8s1pKX1JFuQwqwE5vymxs0+BQMOkJB3ZufDG95YhYxTmaUiLeDVsm
	1RgwrvvWvvEv7m1MmAb/Vbpwk4XD7I3EOB1GwEDHKLPiyHJuIm7oMHtQvSuK/cmxQ
X-Gm-Gg: AfdE7clDn+Q41u5bx/wOJpH3zR9jUMp+1Eac8D4Aq6Q+wavE33JD/AAybA5ouE7927A
	nyg6k0uKXx6kBPG1mHgAVvq29wnWwvbGHNgvvCcNYZ0vQFSASHrmC2mzwp5SUVyvUJ1I5rTHUGL
	9ypfTOCxA/muCnykdOK24+GUoJ4iM8BPa1e+LOlhguAkpGN2Mn5CCsqv6/Ug+Uq3cA0mrfHb+YG
	CF+68XiZZ529IFHUfppTtZb0SDhBWdClVa31TrNVdVyKdHOxTozdyhksS265N/UOfOczJuBnnEe
	o36QxGXMSYy5zldFmwEa6sa3EkxUX4M3kRf1WyxHR77sHPW4f8nCbEAdL8+is6rOpylIVeExCON
	WW4aLZSPhODZNGlWxKPuFMaS2P76t5/mRbLUZzI5yWsg2m7MU16lPgQOpu3UZwjUGDeHDnKQpJX
	pPj/g7kMN5JK4frruLqetkOCE1W5X8TTh2Amr0ZDq3
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572641637.32.1783922073866;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572614637.32.1783922073389;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm67753127eec.11.2026.07.12.22.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:54:32 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:24:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <alR9kQyO6fQ3MOvI@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
 <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX/WbPiWSy2Swa
 4epffo+gTU0jwlzO2cgukluj/TxGvAO3c7qxtoWZnL3Vaty+hSg2OtJO4XwZE0XpPHdzyq5pLEN
 qRp4vxAlpWY6U4vEzfE6adC5hoDf3Lw=
X-Proofpoint-GUID: F3IatmX-E2hIKlv4TLr3DPN4KycEsu-Z
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a547d9a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zuQeyNwc5QvROW1TF6AA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX4ZrqUuN8fwOF
 vRTYYBNO/1ozzkk+eZgNv6WLdh6wyq198GZAVRPy5g7dbEPWuf/LAh70UXvpNz29vS0dhhWObYN
 c3811bCPN0aI6s6UV87ggtai0jDXiZqiR4F9Fvupp9JX/JbQ2MEI/VjTbXTSJfIvF66wJ2Idycz
 vHHyMzGLzSKuTHJVNZVnvHauPF6VPrzEiHJhQ8ydQW/1XqonboMUnXMJpLfhjOxKD3Ia1K13XxV
 LB7MiC7A7x3rGUjTUl1c01Fot/J6uzj/pOvXPzr6vYu09eZ8cWUcS96zQDJBwzaV2ktKS467zZX
 bf90OYs65Odn0H+bZ51WQCJ86vGj8QHGaE0HWHE/ztaR05PK8k6FnxovsNvsBQMd2QB+bVXm6uY
 0eUAu792TZUCo3qbgWvDe07bEeHzzyCFMaW7Dr2zi9S+L9d1WP0XiGsRHnUhNorW/sDuIU6Uz9O
 ygrqx/4UgCNJJd9B1Iw==
X-Proofpoint-ORIG-GUID: F3IatmX-E2hIKlv4TLr3DPN4KycEsu-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059

On Sun, May 17, 2026 at 09:51:52PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> > On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > > Use the icc-clk framework to enable few clocks to be able to
> > > > create paths and use the peripherals connected on those NoCs.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > > >  	.driver = {
> > > >  		.name   = "qcom,gcc-ipq5210",
> > > >  		.of_match_table = gcc_ipq5210_match_table,
> > > > +		.sync_state = icc_sync_state,
> > >
> > > in Kconfig:
> > >
> > > select INTERCONNECT
> > >
> > > OR
> > >
> > > depends on INTERCONNECT
> >
> > In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> > COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> > INTERCONNECT and INTERCONNECT_CLK.
> >
> > Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> > Please let me know.
>
> I've sent [1], let's see if it gets accepted or not.

Don't see [1] in linux-next yet. Please let me know if I should change ipq5210's
gcc to depend on INTERCONNECT.

Thanks
Varada

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com


