Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C83DAAC3
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335562; cv=none; b=IfUcxY+Z3MTGzK3Gb+up8GByiYawt0wlcqMJ7rLT+6yLwySDVX3b6bJnjJEOIjKLtQrHFpk1UBiD29UrJFVcVG/TyGUoPodBMBZxxhuKC9Cv21NTel8SLxxNst8i4seavAowhZj5l1A06evTqmPrar9jAdTows4HyVO4dSdUJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335562; c=relaxed/simple;
	bh=vS/n6FpRvsfmcwxTkH9S/ll+Yj5BUUp5Nnnp42lgrTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVtSnEGunp4JuoGGj0yKefILjewI7Wng9CAoOLGlk4wxZ5zIjou7VfJuPOzflV8UJFUAdZbVoPgqrv36EePjY8bPLcXCD4bS2GgUUI3ZEBx4DA112ArK3D12V+YGRCY/ZQwnNLzae1G9OoOnR667qMmcOIQ3JftcVIn1WF7E9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTy54Byw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGeolsm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTy54Byw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGeolsm1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VVEC079082
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 07:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=; b=jTy54BywqPTSFTKc
	e10Qd5SSwa9PnvhTAt1zP1ZQkTHhlG6wPONubZB4v6pvi83tQIvJsJosNTTjsYd0
	mZmaeefAc6KB8nKYtcCVjsyQuZb7nP1/pNgulX5vZcBCc9HGvTso/tOIPAmd+kKF
	KW/tZPufHJACpn+wID9h/eKFaMhMfZDiZncxeBvA17kTOYD5l5EYjnpIbjlAudbW
	2dl5ORNL/ZG83GGhOqa4/5ZUbUjavBDF9xRu+cIlNhMlbyI60Ospx5C+IiALoiOI
	N7N5haY+5kg4ueqbph1lGUMAIGXCaE9SeBqiStfqpgP6pdnq0yOwLejysdLh32R5
	3b4FSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k2ucb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d932ef41c4so12167645ad.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788335556; x=1788940356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=GGeolsm1BCZ9IBJgiv+7sv8cHwR/Ij7ukEERws7/6nuQVotcbOoTUfbc4rAcBgRza8
         Uf9+sNZ28J81eOqisn1jCOQMbpbm3Rqc7ucPYuVevbDBfAYjZqx6DGSqXUJdDSEjzdlv
         9HJafe6jlo54IXGyWkQpe10AeatmHh4W8ljSKl7Ts32zgY8jsBhh9By0+x4dgQHjEodP
         E74k2qcrhOFL6SjJb4fOjkqPlJhR/pzoYN2N1mxYo0ZlKqv8K2hywXGPoY2VXcVmzhLH
         PnEcJek0Gpole1mdvBlJGf8BrnQHxG8MxNTTAjGsxK+mujoZj5P8XSy1MACNSDsJSGti
         gjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335556; x=1788940356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=V5knPLTKOe74iEYwteBEZgQxcgNiHYK98cx+R7tomEYM26mMhKkVc9JK4rRhKz2v2O
         tN8TavRYGwqgDnUyAuEV5iK30U7Fl7KW22WF0uKgRuIMIA2d8WuAIvS4/VEF5Ibkx0ia
         SWYMz+7ykS3jOP8U/W65wc1Ey3/BE4ysmu4p4JMwckFiQ5BOk7H3sN8+hl6AyEdkhVem
         O7M3Zxv0e6g6ploN2+MSlm8jhVlNmPuXnLJWm8o4vJul4bhXxWvFDzAISqhVq6TrS3ks
         9CyvNSq2wjCNJYyA64mFjX+GD6cckXD/Cc+9W5khCZjsI5lezV5lOe8b88FOdQKmdDl5
         jERQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEjz20tywJJHoie2xlEHFvZWVRLb5Otfotf/kB/SiIQnss9ezZbSAruLy1e8EWU+2bKMe3FeMnHBHP@vger.kernel.org
X-Gm-Message-State: AFuF++n/UeZxtLjT5Mk3dkgdzbqmqpv2v1a6vDMxnjMHlgyxzgqe9/iK
	6aEX6+/UKzROcFm3fE3HPTpOtv+3cbN8UiaiI+9GA2og1tehyza5F3TR9Eyxkr5zMqExh59Wxmc
	/YXtLDEW08tinS7EY8oU/jOfKBqXJQsMrBhlODRzTYjVQTlAk0hqy/iqiWoGtlwtIbkzvCbZ2zB
	w=
X-Gm-Gg: AYBFou2d53bMwD3rnU9n3UJvkLu4wnZNXKIkPLHYP0BVW+u187ZHaK7b8OTTA87Hp68
	ENjYJrKU6A7scfWPyAnrL05qhgC6+ejh/IgR8sPguECEcfJj6tRub8BLJBi77EKhvwF9K20Ofe7
	mx/7wosmYQ/cWOW6uQvhvRKP+RdfESdGHBkQEkDzC5/dgBlP+RbbEIgnKRY4nLigFxE+DeyWIqo
	lRY2dbNtVCvzJsD8qd5Io8Azl/QouJEvmtKkdtjYW/quqTK/WwNzscysIHnbeX64HMJYzUiz6E0
	RNFoqlHrPBVE3nZclcrvfqDWl0FROan1X9BykVPsweiUgxDAnoHA3yJi6kqIazs4h772Lvj+ESj
	qKCzACaLaD4b4YwRdr/nwgP0W2K7lCJ/mmBe26YAZn6U=
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641765ad.23.1788335556358;
        Wed, 02 Sep 2026 00:52:36 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641525ad.23.1788335555939;
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79898sm5004359eec.15.2026.09.02.00.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:52:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Message-ID: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfX9EcgAF/MK4gm
 Ig653KWQJBDA+s0lUtUbjQg9XeUwvTnyp05sZIgOU0p+IO7v8TTilUPFYcOLaPSd0twii9bRUJj
 6xP1j3BIr+aU556ZsFl5HQfSfm0QPNxoAH7jc0fiXk56thB7V6DCrzxAEINqGBA9rWUSzyykjE5
 x722IUBHD7K9dR3VmqlVogRSFI+W/zxPKP2HXxZKX5pUdMM1T7lM8k+wv72zuIp1FGyWAvfc84E
 5JNrCn98MK2MEBElfzUvtAre3PX8tAlwj+00dFne9gNCef0BQ7Q+4m1ZZsEeEiVXiyQxt+fOeyk
 qHjDFjw3cGa1z7sxHcS4uNxRKUGYN+HupOIUIFETqVjLhNUT8HmqAf0cdGVbxVNiFE4EyIToGOm
 dE+ceR2O5UJv/101Ff/K2D6wPsRlorS+PN7wnogp0AXq3ydVNAbmsWYgiYbtVJNxGSYk17dcCQR
 gi5pnrlA6vskzMABDeQ==
X-Proofpoint-GUID: CGPpi_EEn_PmsVz_jgv4t0j-csmywNyj
X-Proofpoint-ORIG-GUID: CGPpi_EEn_PmsVz_jgv4t0j-csmywNyj
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97d5c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aF_vd5NMXLjnXWj9f7cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfX7SRrkRBXG6/X
 OSLbRjFC1faxu8aPTq4dvdVSxMhu0aQz21PRjavLdAED9PwRBOEkf7JJVgLpSlSABpOm9R25apr
 KyKJY9IydiA3zKbGazBVduWf+1wHgzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020069

On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> On Wed, Aug 26, 2026 at 3:55 PM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > The Nord CDSP subsystems do not take their memory rail from the shared
> > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > power domain table.
> >
> > Changes for v2:
> > - Drop remoteproc changes since "mx" of remoteproc is just the name of
> >   memory rail input which can be wired up to NMXC power domain in DT
> > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/
> >
> > Anurag Pateriya (2):
> >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> >
> >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> 
> Applied for next, thanks!

Thank you, Ulf!

Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
dependant DTS patches planned, so an immutable branch would help Bjorn
to resolve the dependency.

Shawn
