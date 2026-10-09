Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462654DE716
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552062; cv=none; b=QYwuqU8tIazCVFHz5cAW70Z6As6mNHTYaQQtW9uJgSwksghm2p/7yq96obdpkDNzHyFr8RyIrrUUtX6zZhOkGzt7s/n8Udm38XIS6ODMvBSHdvQnvtlOgCb9T/Tzf75D92kmYYYtapbDqbjyqx7T/yNoxpEsCeQP3F+5NrasYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552062; c=relaxed/simple;
	bh=aOo6YgfBkBJLB/5h2kLP8CwBUiJTIszfFlbWEOM24xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsNmprwtsTkR2mBzbQp5GSF2n0w/pugQzN85Ulmz8Hbq9Rf41yPtIq0Q0aIzvBx62FrQSNJck7qLx7Mg1w/hMp12h2t+pi74EQtWcMZBmq3xP3gTUPd3SGZWwsRSm2X0uxS3OOSJ+8yCN2KBzsPtCSQQ3TipgzQ2OklRzBmsWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T67QzMw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPVW+DsI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T67QzMw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPVW+DsI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKKfc2916638
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4YcAJRG+vmBRk0xarN2r7ef8
	cFkDQcBJMpll1oXOAUs=; b=T67QzMw0FQyLGsTJz7dQho7dDIHV9HEaB4EBDqYf
	a51F6zFkzlh0uiRLYofyJwM5MV0zLu50ZfQw/ptPKGp6oM8MQJi/Pg+HrrE2EjZ6
	wA5LsayQ1tvNIVBgAofgOtbYEKUWxREW3230W/7ayHVl6YaJowDBjOBM9UTNucrq
	idZtlzsYkcIJJ4M3/C98Feq2bjWKzhffG/CKJTQOdfEV4hCJP3SnYdBQOA+NlFNr
	Wk7IzuP65i8AXiUdXP2ljuVr5jLjelfh3dW79AYSxQWYmhRfHwj7YqRUDMD3/Ra1
	7oJkhLxFBOzjKbS8/ae+JDCkDmUK56y4Knk62dY/XjIx/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuftg29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:21:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso1244058185a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552059; x=1792156859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4YcAJRG+vmBRk0xarN2r7ef8cFkDQcBJMpll1oXOAUs=;
        b=SPVW+DsIyIMV3aE7z7D/H6qtOc0TSVaEkGJmwQAvTb9kY4KFM7wuYaD5PTeY2egcPz
         irf8SIYRO4jOw+1p2ltCGrBVfavQGWcMf4l275CM/b8GIvoioR/sRf8wE2t2FGloJjZw
         5urKn2MD7uBIM/epA+Djos/irdbH8080nk/V5EQVrsz4GQklrF1ezYerfvdX1VwNqEGL
         yPhi6wBctj0DYj4Pi+20/umY4IJ2xlWx98eK9BZxRsBZO9RIHtILWKOYu0TktPFUoO4d
         noZ0dBaqsvUjMJo8KW45VmLTi8tfNbll7u12CMQLPOJcePTg1SWCUhe2TBmJsBmbgY+X
         J/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552059; x=1792156859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YcAJRG+vmBRk0xarN2r7ef8cFkDQcBJMpll1oXOAUs=;
        b=wZHbiQCzse3AZ53ekawK9UueH1uVequLItovJ5lQlnrLaYtZz4kLEAheQwxOXn/5/1
         CHkLdH/erH7r0lqRf1l8FgT+xPjhtbaPKBbFBwb336Kop/Kx2G2hnodiHS83A1PsiWSm
         +e5YxBC+my8huuRW/Amz8fDVFj/I0taAU0lMAfw/CstZJ+BT98hmjon7XcKJa75PCjvh
         il8P3txSlHEJikEwZUwM5qL841oNIWzf8j+0j65th7SpcRs2CAZXy/VyAJT4NZDB/9Zo
         ADn5pM3VeO+PzQ7EEuh7j5rRywRt2ar9Qs+ctPaHeX5r/VZOKnQ50iZA1YFC5bDjEwAs
         opiw==
X-Forwarded-Encrypted: i=1; AKwUvBwl2xcgpXA2oFEPFa93FZaYWLBYNwkvczCT72d68N5ppfV++6Zx6m65f8ETzNk08dbnGQnMUZnZ3NVM@vger.kernel.org
X-Gm-Message-State: AFuF++lbSrpZkE3iAspkBXyVI6tbqHga729la6sMw1QGvQjp8wiy1fvz
	cdbr9eH9Y0Zkf1g0xYzWX+yO/5YigscB4bzmKI+dpgb6VGK/Gh58dtImpJxmZxrooIXGHPliy6i
	QqizEBA9ezM3xOlE4LUETHZLZ4OsIlUam0fbiw5SKfFTBJ2ldDb+/X9RcTbpxDRis
X-Gm-Gg: AYBFou3vBUcpuSXgSa0Flb94DNJvMIJapDq/x8qZjcz2sMpvx3rDsS6XYJXXyJr2rzB
	rKwTr331s3EJf6v0U1lg8oNjFHOgKduGyCjeBfVDROtjy1muztI4jkfkMXQvalC4ruw3q0uosYY
	oqhCJbuusGpM8a5yL8qvmokd8wYGcbxzYGsRKhJotqqhGGrZuEWqqjcJZV8je6jTliVtiLPkz6Q
	w1MZUW4ap/jT4jgVOJkwqJvFOLxS9amTWxTGrQwYNWRyRbvq8sbokwyluTKdxwijQr4VQZvCVJW
	gTnNdKZQiS6GKsypCYbWJdfIi4IsVI8+l9vF/U53jgy7U8+qy2+lv5fNsdAU2YWNDv8Wt1HWlsA
	YKjG+Ypi/yA+Vk8g9cPoSrLTR86/fMwLmyEplzmId4ieOrs/AkwWt1qq7EShuo7ucEpwxQIPM0m
	07lIuATPdRMxqt
X-Received: by 2002:a05:620a:6489:b0:939:3885:3131 with SMTP id af79cd13be357-93ebd0c2fc7mr254209085a.3.1791552059320;
        Fri, 09 Oct 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:939:3885:3131 with SMTP id af79cd13be357-93ebd0c2fc7mr254202885a.3.1791552058789;
        Fri, 09 Oct 2026 06:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befae8sm6442831fa.4.2026.10.09.06.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:20:57 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:20:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Add support for Radxa
 Dragon Q8B
Message-ID: <zzl3xo6njlmuujbscy3djy37vwbs46uzborf7zpziwfegkgdy5@x5jybhyqpwny>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <179153455955.2970577.14103639336377928226.b4-ty@b4>
 <b8cc8683-d114-48c8-af60-ecd8e16bdf46@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8cc8683-d114-48c8-af60-ecd8e16bdf46@kernel.org>
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8ea3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=WytUIncG4urx4L10ewwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX+NRZw6n5V8Qs
 tTXtif1FlmMgtOH3tydc+0MCKzIMtGHfjnP3C3EM8YHqFScPNvHNzBFhZsiLFGMdtBBD3ZO2kA0
 osVCKzmVfpzAPhBo47tL9RZIbH6JUHA=
X-Proofpoint-GUID: OJ_OoxCLgR0dZk5JqebA0bKuPGsAPJjX
X-Proofpoint-ORIG-GUID: OJ_OoxCLgR0dZk5JqebA0bKuPGsAPJjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfXwp1fvSZxW5Cb
 fYCNoD5GGgc0UAtJYSMsckPw28men0XIm6rnAUWjOGzv/NQEZieOETNY3zAIwBWrzP/fA1k4lQG
 2stHLMmF+tSvJ4EqlRQpfmmjAWDrr3BY5M4NXX1Vo6vozduEff/axrKb1Nt0k9WlEzAXKRrmPyc
 DpWAIgt1HNnMPo8kSbzNGiKu36HMI+/nIguQYxPAeoh+Bx9Bc7sR3UVF6Qh67AhdqTQ3hBtHckt
 ta+luikIFrtITUTLX5lEdx42l6PdGLjDAgQ/CLK3Ecy31uapX5ikBOAAxqzkfTT4a6pQBCgAZ3Y
 I7p/orllHsDlDUhhYXb5c7QMFfosGZEtk+4z2evT9cpCozfCAagNW69GqOhujUNeY9jVWCNi+Sv
 zyssE7EzIJ+YTrYsrR7dzqWOXrnH0edb7ak8+/QDxokaNOMONfiX/liAuL9Xu86Br90M8lesrUY
 kW3UQjyKrClV4W7yCcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:43:09PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 10:29, Dmitry Baryshkov wrote:
> > On Fri, 09 Oct 2026 15:55:05 +0800, Xilin Wu wrote:
> >> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> >> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> >>
> >> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> >> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> >> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> >> a 40-pin expansion header.
> >>
> >> [...]
> > 
> > Applied to drm-misc-next, thanks!
> > 
> > [1/4] dt-bindings: display: bridge: simple: document Chrontel CH7218A
> >       commit: 377682cf917027396211426c509cae5785305ba8
> 
> So the fake tag gets applied. Having 12 minutes to respond to this
> posting is NOT enough.

It had your a-b.


-- 
With best wishes
Dmitry
