Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DB3321DE
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776541108; cv=none; b=U7ZAjbMXC/ib+F4OAcV59dz5Z4Vs4KUhvJ/aYJLXIcMg/Y17z2t1dzILZA9ZqmZqdzMM7fdTTAYQq1NoFP/6UIQn13BFXgxNkFQ1b2CsQgEjSgMYv2naiYRHOrV2jNMBZuV6RQRa1FeEj7Bt7uYK52kf1mUkl2iQZZFFCKHaSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776541108; c=relaxed/simple;
	bh=D9bDtXxW3hYg3zOewGGHaPyX3bjoSoMDKPBs+JVD+jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRqG14zfGpQfCpM2r5sz61XrT4kLo9g3UGtcV3K3JE0/8t9heFx4SlpsL79tCyKmtOBQ3QLmPEAgkBtdH/jzxWSavOiVhdtZZ89gZ6zcV5rnNWfMTvjhcw2RlvhZBSc3I19rw0E15YK6K1nV9Cy4W1T9Q958llokyNe5sQsvv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPZXIwGw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvFRYeH2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPZXIwGw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvFRYeH2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4m2Er2567587
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 19:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbwvqRx22EuSdW1o5avcOXEZ
	l4XvhLf+30K9TnHpX7o=; b=iPZXIwGw/DRx+Zt91iZVqqLZHLhQfaqwatR2rPg1
	i8q/oA20HMpxH46pXKnyynNMPPH3db0oFL2PK63Bs7E27TI5ymG5qeIbZF5BvULk
	fRL+sK6vkRG52aO4231tZMZp6/iiQg6i5CfN59YvFzpx/VShtp1gXg1vrhaOqV+d
	sFE0aHqta25IQs3krIY5t1bY8CMV3neSQM9FM4XkgLm9RecZM35805nez8FbngXI
	oSi3ULWHzpk6HGHHBH/6wUwPVCfWam5B1MN7PYZg5E1pyeEM7b7ymoyHzfk2d+Mo
	pacK+MXqrVp5Yz+tWcCcwbV9AGMreEJX2ukMqJDehzcNAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388h98d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 19:38:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e423a05c8so21335311cf.0
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776541105; x=1777145905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=GvFRYeH2nJbXQnVmTxae0cy5BJ8CC7+i6hHTuJzCbz2DZFQuqsp6h9lsSypaJ+R+cI
         jah43EYBSdWQPkMBJjUnHE3D3EJz4oShRVHehZgZmrdRI/vh6JqMfaY3/CAUzsagDUif
         odZGQ6ir9XhXkXSZX0iC6WBSmaCpVKaIiO2H59+3lW2cE/HmZl3WtLyBFpiok1/7vgHy
         l65wNvqR2nMICFVuR1Ly0GKJkTSrCUBtAW8nkQLStdyGAp/xHr45qG8f3S12jxNDg0W3
         mknq8FT85rCigmT+2sj++Ytf0n7KH6U+JgqhVR8g0473fOUeLVokq9RNKiQ6jEpdvRYz
         M61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541105; x=1777145905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=qNC5bm5wgFgfGLfcUn7rCHoCzpLAKtia6c1D1csryckXgeBi/NsNY9EzM+3YEqRFJj
         wqJaSqr7+VVJSXXJq/yyhdEv09NMVq1S8vL41/k8exDXb2IMeV3fGTnjqOtqCoHFDo9N
         dCyS7kITigcRxQdFRZIl427M+ejqXXojGpk2s/gfLnz9KDjKAxc6YU0UKvSrXI72DqTP
         hiTyTcNudcVx7izw8VEflG8xERkLX5bhFgFx8d5THgq3jE05pPFN1cQMRzkTSZobNXx3
         OszuJUukUJyOIXBAnpaYsGYnIqFCyBekFKKdP//S1zgF9Q5bDBg7L5rmswavr7ace4hV
         5AmA==
X-Forwarded-Encrypted: i=1; AFNElJ+3YwRQw1IdRuUfZxB9jruyFWifO0AWVGua01Vq5Z0gIBXCPWefOHk/OVxGScKO01zrVmg40Wi0hF0n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wlQfzsmGHEEx7cVPRKKu1FWKnUDI2unnftrQPYw8ILP1WwHW
	MzjWNxOF4pm+L12o6BxhQuhOBIQUGFKnI4A50zZ+1Al/uBIs4hx5dRL61OGmetH5+2MV7wXImAO
	LXVd/i5EbLqFtzKL9i5HCvENuiUfFdzV9bYmEomncPmmEPymeGM79A9oSAnP9CC70
X-Gm-Gg: AeBDiet74R8+8Xuwlecrf8a5zemJuOWzN9skJQQ+xO7Sv+i2nfQdXqyfpIZRg6MzvOR
	P2/SxMC4Qvmo67NyGl5lVu9OIERsXJN4dVkVZqRRM+TSb6YhXWosg8dacVkgo/vcnDMbF7Nwbzk
	/b4NyxYAlOgsc7I9VQWn7F4890vmK54P3D+mOFJ7wBjctV45FWzECo9Ro4RgeYdnMunw5xQx2xz
	HLSf4jpJwHINvFgYYu0bbeZfr7kRxTZMPf3k+cbtO2cuAo98Sk0OgB3Np6BtmRjXj+Vuca/FgJt
	f7ExDNZAONe8MNt9Phsg6ijL8QbN3zEcLPK4kkuvqn1eRCQxLdIpFmgD9e4Y95fnV9W/2T/AksW
	BBAC1NLn6oZUaI9K1l1fClu07owjumM7+DAyNSaqTE6CVMFlus380rZOPsNGU6FmEkZ7OkvxWJg
	lsr6cWw48fn7C2AU+aSjhigQw9U8gJhTZ1+tW133AogigfyQ==
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389841cf.8.1776541105484;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389461cf.8.1776541105035;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm1553387e87.69.2026.04.18.12.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:38:22 -0700 (PDT)
Date: Sat, 18 Apr 2026 22:38:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-ID: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e3ddb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Rs7pINfTDodmtXVth3IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: XC6pEGXohrmrHRbGCtApzY-xiEE57i4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE5NiBTYWx0ZWRfX3hC7TGOgeGlV
 JgWq3BvZvJ6cSHySxdhoTMmnSMXIbJQmaL0lcEk0/bpwWNh16HH669OnDo1FxW6/imPArqaTken
 1iLqSvjO5DEco8R7ZuWLseJhLY3EzBxyF75QXhSEhgy8fvxh8vqvwA01wJP6cOQBx/bVUKouWwT
 bCjslX1LpSWsR8sBpWf6aseTaIpLFybBlgVdBo8fEuTHAdb9lbdS68PJ5UIIj6fGsHyLHXdDOgR
 q9YKYI4iNHLD1eF1ll7O2iSx+SexWtI5m31cD2DkOEJJYn0gfv3CJdLSMfQLPyek+dq0xalMjhE
 LgTbllymzEDdtlsxa4+TthnSxgXBhgeqIUNFGYhirwWoDL2aWIwHRvAO6twnObbzF/hiK+isGfq
 W2bB2ujyEpcGmRtiY9SMEVmK05pYubclZnnJjKVWMi93tP/7ZSSLhShfYPxWXnxEr0tS7At/uf+
 MoJlwoDOIbbmdn3OXMA==
X-Proofpoint-ORIG-GUID: XC6pEGXohrmrHRbGCtApzY-xiEE57i4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180196

On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> > voltages over internal rails. Implement support for using powersequencer
> > for this family of ATH10k devices in addition to using regulators.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++++++--
> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
> >  2 files changed, 53 insertions(+), 3 deletions(-)
> >
> > +	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wlan");
> > +	if (IS_ERR(ar_snoc->pwrseq)) {
> > +		ret = PTR_ERR(ar_snoc->pwrseq);
> > +		ar_snoc->pwrseq = NULL;
> > +		if (ret != -EPROBE_DEFER)
> > +			goto err_free_irq;
> 
> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=n since
> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
> here.
> 
> I'm observing my ath10k_snoc is now failing to probe "with error -38"
> which definitely seems to be related, but I haven't debugged it further
> yet.

Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com

-- 
With best wishes
Dmitry
