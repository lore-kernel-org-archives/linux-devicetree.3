Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025C4503E2
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423242; cv=none; b=CuJZ0vc3/H61W86jKccWX3DHvV8Cpkc+MxQJTzQtFJaulwcLYznUGYdRGHSRuwe+mDCPu/kQN9OMLvs4bENdWj7gSH8Osl0m/enGvjSXINiDSsxr298ak4trln+wsU3lAnxEXYawlVGlRsSNNe/wAGUfFGTYrCM8k4FOsrCNUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423242; c=relaxed/simple;
	bh=Kwn99ugm/ZvxvKfUKhfw1o4cwgC1yC46F1kq9setXGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3vql2iX8RtvWCoB99EngajJZJndkWn50L1XMIemx2rb4Jv3QWyCd47ypcmmCjfPvf/76lKFjrOUKc6Jrlfx9iNMHsaXXFLsRIhGzmdUY0WkhTIzo8x9a0cMd5zqw69RiUqM8HSHYYLu7HkYACALgTkr20MryynxA/yudu8Amek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBbBHpes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AahH7mrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBbBHpes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AahH7mrl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lnl8080077
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7zOe1SfWnthxqKbUkw/fj7Kc
	vjW4M5oA+dkrQIHsBZw=; b=JBbBHpesIU/34nVVC6lQScSYYl+mucJz5mFZacK5
	typCHmRX9IucPxWTAcCOtTE0lAVn5izPOLdSH2uqMgPBh7zlEaXMQ4lPNtzrYQ/g
	FZtOTstJDpNFrKIx/NAndcr7vHzohv99Ljrfh+hSNQ+z/k4A2db42qPAl/kv+lKo
	HYrSHx/Orxemub8KmVRv6tOGKra6fVTna5l0Hz5wVPQQ5nuoNiYaW4G6x4SceHLZ
	Xc+3nszClvy2XyQEymofMJzpA/308Ld/ItTRAeqpjNSGHJvnpPpXdnusJmPABMQC
	NQ6/9U/NJzBQbGi+9GLmjAtJPCxHvjanyoXfzSd7PzhNsw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4gv6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:13:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4879622a91.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423238; x=1789028038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zOe1SfWnthxqKbUkw/fj7KcvjW4M5oA+dkrQIHsBZw=;
        b=AahH7mrlq59fayFATH4WleUvBUAAiRRe8QZhQ27agR0/k5EaHlFoqUj9OR8UN7IL68
         NxbfcFYwqnxdBpn1wi3mGJR1UaysdpbFV+7xLF1fDmcB5ciI6nYx2kxJZIzDa35OmsEH
         7KoQv/tjtvW5im7AZ9K+iz5TNFWcaJ3aATmwRO4U8uWFeguaq/swHPLzSfKFaLs2jUhx
         IODUo1y8WNU+Ua2/HOnABCMP305HuJnlWYxZMppdbhbVMMyH7rk1I3jJL9N7CCU7B8mv
         dwE7Ri0ERbTklYaIIPpmekx00R4VfE2PoiHiRTX4x+v8XDlv/CnZ0LC55cdU9rtPhIQB
         IGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423238; x=1789028038;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zOe1SfWnthxqKbUkw/fj7KcvjW4M5oA+dkrQIHsBZw=;
        b=UmfDn9Jea3WUjNOy/yNnjcGoAfpeFJs6k74jpBJcXsnehdb9+HKzlDq7J7/L7rVgT6
         SMZ1805vMHYyo2jMczYeC5z1b4rFTLWtEvMrr+bVv82WVgASFzTOd01LbyARK/f6SNIy
         BZrWCrTkLaHw10JbWff26mi6BOjFs34ykYj4qWKD+QGA95hRUK5Bqq7k66avl7pWcbRZ
         p4hyNOGYsofkNZekOe1FMH23wJ3Y2+ZatQA2tHEm65ryZE9orzyU4RnfyLVUuv4uL48/
         OkWVlteOtQQlJRVxF0DMm/PUqyI/Iq/tQdwTkP7RwRujvXq1YjIe4jVsysFNYC4Z8Bow
         YmCw==
X-Forwarded-Encrypted: i=1; AKwUvBz/b8KlQUZTcX88yJ59TKaanf+CiYbMmM4kk2H/VVMd117XmeWzsHcrx9Lp4O3kd0ppcZZp0ozuzM0A@vger.kernel.org
X-Gm-Message-State: AFuF++nVbNiS3bAu9nhAUXwOSDaHTa9D7AoVXcABq4eNT/iGfxMJck6H
	fLdFR1vrPjDaFy0pcfjHoRBBlpV17wsDfn8KsfRGp9FlFCAQPZXtWNzxis1pPfvmMIOvWeEC5lg
	xS5NiqlIhI3RKS6BuIa7DorGt7cJxa9EF35AzO2LXbLgJ+T6KpM78bRb9rvJ6YsjV
X-Gm-Gg: AYBFou2MhHyIVBfjao51b6uxERrtjgt9jTl8Ejh1kpWn5vBZCl5d+z5HQ3wATM1pHbF
	awDCI3UopB07/0hLV4oSihj7udj6eZg5hZwK5BBgD9RTcDUYPKf9NqdmUjPHNGMIuGPBwgOZBLO
	MaYejAnuluNeeN1HMgu6CxZzr2lljLL64Pp7MBdfr9tMDTcYioVYWWPtYlscnw0rPG4YD6Cgg0m
	5pf+Q3UAtrh7RST/vpKH7YN3g5B8bmEk7A21KNVIgC9+OIcchNmaGyEVmuRRig4PEfw0PEfR1+0
	f2BgI92gp2Lh25MZ0gzebiE7/TdfGJLqV8MyFgLXurAc7GlvqMPQBOndDYD3gtxsUffy1uTf/Hd
	le5znGGl61kt+3OONlUlza8OrzrygXmHOelkwzsftNrU=
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr18545277a91.8.1788423238050;
        Thu, 03 Sep 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr18545072a91.8.1788423236820;
        Thu, 03 Sep 2026 01:13:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431990a65bsm4027898c88.5.2026.09.03.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:13:56 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:13:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <apksPqKhUdb6bnt8@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
 <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
 <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a992c46 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_CkSUWfd9DtlKJbLfMwA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: eO-N8A0lpb68W5d6z7q8hSlQQLHCkvsq
X-Proofpoint-ORIG-GUID: eO-N8A0lpb68W5d6z7q8hSlQQLHCkvsq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX8Eas/HJVphCt
 q8bVKKoW+huuz1kRtFikJlhcb6bQKoygZXziIghI5x8km6E7ufhMVvvsdKfWg7LXsx5ROWlKlKV
 jcJm3AZP8avTDAV95K96E3Pp5F4SwdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX04bpbfwdq8ml
 A0B83oV7Jti3gx1d3BLgJjzHPdpSb9P+z0adr1+pNnnlkpHhKE1jpT1IiwG64DnuR4cn5gBAfPE
 au3v3ZkLNBDmNT/98tqfbWPZSg0lWtz87ocWKM0GHNeHoqBjV28FoJlDZ02rA47S1oDz5+axHYo
 0Y+QrjXAG666TxpJkq+WHCk+lT0AFW6m+LGOc5VqVB349PolwOaBM345AyFKufwIZ01dxkAQtua
 3dsFnmnxrscO8/Olrm21kHQOjEdrT+2RemAKIQa/NNnOh4zK4V8Wkm0ZZHQkkVG1wWtORSD4lfN
 4yHr7mZx9owV4FKKehLzJtlC9RN1QzAU8EdpmhDDk1X5pvioYLRd5ioczh8vFTOsXGKOt6dU/Xq
 YlbIvpnyn4jt6ekHrM++tRzdnG5okUSd5D6FjjMvFxQOtwoK7sSVjwHVP8XvcMQ609xyN+1eU+1
 YdPjkloWngYU5V6IEZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030072

On Thu, Sep 03, 2026 at 09:56:16AM +0200, Konrad Dybcio wrote:
> On 9/3/26 9:40 AM, Shawn Guo wrote:
> > On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
> >> On 8/31/26 5:21 AM, Shawn Guo wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>>
> >>> Add the initial device tree for the Nord Ride Embedded board, the
> >>> non-SCMI variant of the SA8797P automotive Ride board.
> 
> [...]
> 
> > Since we agreed that a bit comment is useful [1], I guess you are saying
> > the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
> > comment aligned with nord-rrd.dts.
> 
> Ah I forgot I said that :)
> 
> [...]
> 
> >>> +		vreg_s7i_mm: smps7 {
> >>> +			regulator-name = "vreg_s7i_mm";
> >>> +			regulator-min-microvolt = <300000>;
> >>> +			regulator-max-microvolt = <1200000>;
> >>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +			regulator-allow-set-load;
> >>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> >>> +						   RPMH_REGULATOR_MODE_HPM>;
> >>
> >> Are these actually exposed as regulators and not RPMHPDs?
> > 
> > Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
> > here. I will drop them.
> 
> Don't you get a huge log of errors with these in place?

Nope. If we do, we must have already fixed the problem :)

Shawn
