Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6178373C17
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811428; cv=none; b=MUdKFtK11RqJ4aMzj44J0kWTus2rbUt4QFgJP/VGYENSFVpd/cKJwDURIcvBWnis4MF/CI7K8kk6uLkEcuFBx10F4bemx54BQh2SbYikrpS05P4R5HWNtl7ayp8u2vU1lJYeuHS7vrDt0g/TAs42+Ef3kB5SY2IPyhAN7nTgz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811428; c=relaxed/simple;
	bh=dZblD0hsjOmoBk2xEtv+bm7XvNn1XdNoSJT9Xdp/pBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLxRU+ddtq5tLJGym/BCJlUAL89Yw1lL8vl6cBMvvPJpjgaC+Qtblklc6zdvqOzyCXCPXhLzgB/pybSUhhL2QVOcLHXQp8maCxRa/FemKMeeJwSzJqdeiSCeDR44lCzgQrXR2yeYfE2n1ts+mR1OXROwGEAssnRXs4OgXUoOt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvW195Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/ijXLR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvW195Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/ijXLR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Xfm2252940
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iENrqNPzMG3pGs3C6u5aujr8
	2Gs7PvX4x7xUK/FQCmQ=; b=pvW195SnD3mOBU6n9GQiqKAZgqtcmA86QyBfTH7P
	rYLfQl1H/7bPQUvzWzSs5NN0mHnfqx0+idE84u3xDq5ub7/3D89oNRGZWzS2HSF7
	k1k1lf0EDuTgS7iX/1VOR0zPpXEmJ2uysDs0fn3+QPjtpeQ2RHaHYxfTSwhgEHAr
	5hZwLikPh+R2I0gi1JNNgO35cwJ286jn9mHeQ6oVq2GTrN5FaOAkGjUa4uMuDs3r
	v4CUJStCmYj2wd2t5u8hrG4Tclv0OQNwqtc+Zq78E56DCGdK1A5XNlhuYGVAtXpd
	Z1GwvysWt5M8RZn1YYlTn3xQqyTmtEc6gQTmSYu79Ym0Fw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7135rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:23:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5632756eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811425; x=1792416225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iENrqNPzMG3pGs3C6u5aujr82Gs7PvX4x7xUK/FQCmQ=;
        b=hM/ijXLR5DzRInNoz/E25Di3PW+0a4reCJpLjNyrA3a3fFQaxu6ITHZG2/aKzpsfGd
         XRHjTJktEZ8OqdXNIiK6tEVTkY4mFflPEGT5r9qBmzjlk6xxdkrd6XC2i+5A5yEUYLIu
         d8PnKpZzgEqel4RUtdz6+SotKHtFK8ZpZm4rZxeTzFr2/c+sqbilZCLuih4zOUkib9Iw
         ObLdPb2wQvNuPyuhhknIfcV46ESv/SX8upL/k1pVGMXOhtNFVWgbd2aknWdrYvnzExZT
         ty/IUCySvd9F0HwtHemn+1jYyRqmYtkRTsC68sp51RG8H4sWdsjekyENvWz7tr0rO/xu
         0nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811425; x=1792416225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iENrqNPzMG3pGs3C6u5aujr82Gs7PvX4x7xUK/FQCmQ=;
        b=BB+yuIyetbAEmvI8UWlrbjq9MZJj0yEtgpNL3LEydo7aBGYqBfqNu+qE57jirFvc4w
         ZGEX8RRA5/FGCIKlg+59bgxW6NbMZ6qjxvG1mFSuAXyJipDYRMO7knNn0jBVUjJVl6gS
         iOM30N6Nm4e1OMI1AAKiRjickTLpVglDQRFyoybaa2Br9gIPfodCNLQVfXVnGAnNZRMH
         G3F0W9+TWrOjzDkumFMwrh+4F3ak+ZYnY3Gxm169bckFD5xRWD035q0KPBhu9+DthTiw
         ZZtEzjLBYUpKguwtLKrUyHvFhzbBZUb9wcIYyU2uxjNe2PX3o97NkIcn8BEt5z8e9/y7
         kfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDuqpoVAxXBJkH+BHjLlkSrxwF13o7kVR3BoKiTvcbjsBElOAA2CDB+PBWg7MQ0wa1pGCLPkJOiHNr@vger.kernel.org
X-Gm-Message-State: AFq9FYLzbT6JiCB28WIwTJcbwPwouiNP/cxGEBhSsaPI7KO1xdw5606B
	culUmrqDqtdVsE5WenyNkVMaOxwbkeIIz17QeVf9daHw0W+hotMlT0GXSE3rOelShnRAx/RzP9l
	rkN64CoZikIRRmqCNAoQfh/YyiFTwvXcPWbLxvQJRdQOBatvSaNsnATOlYv/2qyXZ
X-Gm-Gg: AYBFou1eL3AWcgASVyrO1pK6CN96DFC/1noKQgtfgUmox9TyzlG653P1RiCAYA7HJyb
	eDAMtD0Wqk1x6UfhyRCBHTHzjr6p/3eTOtcUsZOdqVXrG4+u5oJjF9sXJPe8y/cBzYGTCDY/n68
	Hj8aEHSAY3JquXnBL3eTifeEYFTvNQkcwtOSHskQZNwqMZv35TnVksd9kxxmA5gQs5R/Xv410GH
	YFsf6tXG6pGb0IicK+p5b9/HotRTbW6pxeYNevxRA6lbg7Pl3Y73vSrVThQyAp/3HJXzf9wBNef
	ZC972CLQTB2DmsU8pOkxPATCVuxlRqk3qH3KZOGxVKSYjxGum/cy47LYFk5Xx1wsf5CfcifdNdD
	SVwLs9p2/hopq85UmCmDJNTN0MdQf2oTkh2C6AXnuVw==
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr9050439eec.24.1791811424599;
        Mon, 12 Oct 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr9050362eec.24.1791811423763;
        Mon, 12 Oct 2026 06:23:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm22827811eec.15.2026.10.12.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:23:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:23:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
Message-ID: <aszfV2EYMN00RJTP@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX590SME3OhIj7
 Yh41Cy0rKH62iirSPdiWkDTnu9e/7s2hpTt5qUgtDuAa1giPg31AilN+/wxRrpTSt25TvzZuhmc
 3B2zIq/DU+EDhjklH7On30ejVSfD1Vc=
X-Proofpoint-GUID: eUiwqxO9V-US7SYMVoFhMH_tTIW01x2m
X-Proofpoint-ORIG-GUID: eUiwqxO9V-US7SYMVoFhMH_tTIW01x2m
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accdf61 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zFX0IjAEx0uK6ydxyM8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXwAe9JqjUVIqQ
 lMzUIkmyvX2Y7CrxO/fIAffIB0mUU1bT179NCZh5eMARIqyAv5JSbnZygXbBUMALgS1DFDAumF0
 oTSnS+ivMs4hwKrAEqd8GJ9wO0SY1qWW0kYA/hLJZlCIrhVRs0QPnrfFa5I8Vl+eG9YjaFM6MN7
 TNEszGwtptgtAh8x2eGYiylCIvLY/S0nzQmh20wz9VRCl5ZsQEoLhr9OFWEFDZHB2ukjOSA7r2m
 5tpDikhuIIacdmCXhooGkkMrvUJja0CaUt0oN2YSlO12PkAlmqNIUbxMFqVCcp8dIfkmpzOvbKX
 i3lwiPx8R/pczAZAFXSuJ0QL/QUPT2q6qioytU2cDwJW+MpueEwp0XeaRI+Zpx24wvwq1sEVQV1
 i3P+JaNj84lDXxy9zyFfdRqcyjJCADwhVV6zUdIkLobqfxZHqq/XEShCp1FDeTe/Aesvt+hFLfU
 F5DFwabRI0Pr2LzXx3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

On Fri, Oct 09, 2026 at 02:36:35AM +0530, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.
> 
> The Nord primary GPU is the same as A750 but has a different chip id,
> so it needs its own catalog entry. Add a new catalog entry for this
> GPU and an adreno_is_a753() helper. HW clock gating is not working at
> the moment, so it is kept disabled for now.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

On Nord Ride and RRD board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
