Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35E317173
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868188; cv=none; b=OhSUSdDLOJv4/iENJbnb4xK0YrElVS2Yjh0BYxx/AAJfHYn5K2R4FOXuh/UvW63p1j9caTnyYz/I/BGivIUMj4qBJINLebgmNQGHYpAsux6mHLFmQOYXCP4DpM6wlDfBi895132RDc+STXbPiB8YOnoPnlt7lQBwpK1yuwQxLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868188; c=relaxed/simple;
	bh=/03ov1eTTK1DiBCXN0jMeaUGcELnRBbvrFZzLh1XUGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCyl3IfGbSYx+MOesFH82oM1gqqPFKi9taaALn+Fhelj1MJ/ni+3oyD2NFVW1N8IwIOpNpP9kpU6d91ttU+v6rp8C0J6YQrzKvuQnbe0WI5NA2h3HA5v6dSjYQHDGIV7LQDYaaUCFyae/Nh8mn1NhzSFWElpewBGJuTF0T6sYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOZ82F0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kB1RKbPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOZ82F0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kB1RKbPU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkNa1336535
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=; b=DOZ82F0SaAAevnET
	SLhyrXl2ePCZ3Te4p8hOd7z/OuTzxkm9zf4ZwG4heZ6mTWUejc8tsmHMnQBKwapl
	5NJGanaemK2cngOOnzSo+hkm7vRO6mjrBx/aFKjiU7zDjMQz/MbVqJQlYc55K+6+
	GK8os2ezm8MnOFz3PjQIFojnefZjJ+HeZLc6W8r336dGmlGn4ypVQDepgC4NoVNM
	Yw5QzKgDVNCywuhoUNccZHRMv+hUHRLAri26VCbjz05mToREIppQtuk94mOdcu54
	eY4FTRb4AWdjEI3Rehp/ozSVCw2ALYsX3djYg0gbPSIIlwEn9E2BoO7RfMxkZv6C
	5/cI7w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvhms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:36:26 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ed1788158so2160294e0c.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868185; x=1781472985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=;
        b=kB1RKbPULMZHiikJsHwxvX9kc0SU5x3/QRGfmRW9PWqO9SjXd99x6nxOdI/YJEFPol
         Q1/mOAQvJpYtwFiCSkusDHg5s2k72SaCAJEXqdOdcnA4thJQKPa6kS1mwPmwVQ9CjR4l
         AYb4FwAAkcbZvoxR4VLf04t/JNtE2zEKXfMU5tsuc+U3Q61wsotapyzujiZ4Pag/grFN
         FUM+/lqA4Kdq692YRQLa+RqETO1ufTz5wtHquhB0B8dxjLqN0AGtWXhF6RX3QFIU8jsi
         J53XSdHETwPdPOymIkZl7fwVNAWObjPnVPtngeOtCfhkbQD+HHdycGFS+QRU0Oe6yZiK
         6aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868185; x=1781472985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=;
        b=NqO1fCL2L+Va/MXkzZ9tI7xXjtNPoG2QoCAqbfSbP72GPb6vt906lJuuyUjymi9PiK
         TlVOKtBGPLCOXna1lax/XGXY/3L7SgY6+B+zGk2k/S6xvSCnML97Is2og2A4msU/H/Eo
         aqX2UT4KK9iWmVo89qh8BCL5yd06F2A9SWhjAB5OBkwEevgjA7ima2+lKKdslFSBrw+E
         m+ftU7+1nSfHmDvhNUV2ikqZ+BdoTUedM1b9pp1tsb2TnidVb4oj+HcOdqP+3jD5KNLX
         8LrMbI3p9UrIsd/4FREje6kiB/qBaSVMxAA3+KvjF6ZMpaD5tMTZEZEQCtINqUPOiJHU
         rk+g==
X-Forwarded-Encrypted: i=1; AFNElJ+/9wDB/eMDEKF9eH+EWTs5uSwIoe6OUNNAdW2oLjig6UmLFgsJXG/BJmCbMfYnB9IxPfkJVzXrQJld@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmD46hLv3+mbkbBWNwiOfyDJCYMxQR5Ag82B8YXkpU011bpKm
	HuOJt2DSr57F+lkpzgO2We9RHqpAMRrBtiAobeEHfXtFtJSNiNdmzWlCj/gkKjWknVMrb/hOHwY
	BB3Ug0uHbcu7fe5JJ46wHRYHbAXFVjrKCyWTepBwiCqJqLtsIyYFeCocgvXmTFpMj
X-Gm-Gg: Acq92OGKoXDLzjGigE+aZlwpMPpQCLAqzjCXdmBDee+4Tlvz6WQRL4ZTVb9kwkoWnm0
	ZyHEsYSynCiqZTgvLH1wUPVBHrw155WwFSplW3krRIoUaIkOEdHLTNj4oU/KQZrV0DOBR2fCfU4
	N+Ww0l1XgnPUxlx0oiRDECTSKBubhuWRP0J2o3HAZ1L3GBdFkplCP/nqVu8tLqLJHG1OjTv61Zu
	P01/Z3AHCnsBUOTUX9F3eRrwQKcfZgrEfgTuLLZ35I4Vp4Pf3ZG+PsuIEjgIgBioAq1a508AoiC
	+MtPHDbDt+/nE8j+FcDXXOtS37DQSPJ6pb5BYSlw8cZTvrKVw5TCVUPhbniU+MxhMXQLLFE1cSa
	qv/S8PvSeZ8wafJ8AjkXS91DMqGJigjKUlW9ezWRHmgn+jYrnDPdhPylGLmDlL+9hEqB8uKh68n
	FAoROXIxbZ8rqNH4sVqGs5mWOuNnk2PgbLt6+7yCLjftcKjA==
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr5672147137.17.1780868185068;
        Sun, 07 Jun 2026 14:36:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr5672135137.17.1780868184561;
        Sun, 07 Jun 2026 14:36:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b992a66sm3254744e87.74.2026.06.07.14.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:36:23 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:36:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <wg36iuofkugowcfuxz6pzooatjbei7so2w2cigc6ocnbzhktfg@r2bujfthlcm2>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
 <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
 <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
 <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e45a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ql0nBcLY1XnH6QMhr6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: WtwA07rp_r7xGmhWIQ0L37MBBZX1o2w6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX1tAckuDgsn7a
 wsXtjWLus5qqxyKlaXyFnO6J/tRR3CRUz2gKYHiUfkSYXJfLWxMEhiXCjrkM980rEqH4pZUWxFS
 dwEfR47Yu3pc7lAsUukPS6eLyCwI5p8QlJ+1l5MOOaIpmOf2+9WBkcKpZ+9fB4IIfptVZ6+05qz
 FlB1f4YUVSmN5I4Zg1mMAPX7sE1jWUCvW8P0kJcl8InxB8EHLwEjMVedRLU8TRjh2fuNhmKRPYY
 RW/RUMuZUWPftj7i62T41QOM95TTJzKp5Z5LtFWN5purIdJmE3v5f9+t3uwIjCKAlDEdB/PNmxL
 /Cdk03RomBY4/76nSxGjk2lIvH/nAlptYqdGJBjLikPx9C35LGpPJ46cNnMApug0oLelscuuyo1
 R3NIaTf96dqu0N1L4ZWpNAVIGXNZGC81uXxq8D3V5EDw0+M5rXZZAasA+1AX+AkiBNBTwc1FwUi
 a21wItcdc7oLdC5jH8A==
X-Proofpoint-ORIG-GUID: WtwA07rp_r7xGmhWIQ0L37MBBZX1o2w6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

On Tue, Jun 02, 2026 at 03:03:00PM +0800, Qian Zhang wrote:
> On Tue, Jun 2, 2026 at 11:32 AM Qian Zhang <qian.zhang@oss.qualcomm.com> wrote:
> >
> > On Mon, Jun 1, 2026 at 8:39 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > > > On Sun, May 31, 2026 at 5:09 PM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> > >
> > > > > > +
> > > > > > +     wcn6855-pmu {
> > > > > > +             compatible = "qcom,wcn6855-pmu";
> > > > > > +
> > > > > > +             pinctrl-names = "default";
> > > > > > +             pinctrl-0 = <&wlan_en_state>;
> > > > > > +
> > > > > > +             wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > > > >
> > > > > No bt-enable-gpios?
> > > > BT is enabled in node uart10
> > > > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com/
> > >
> > > The BT is powered on by this PMU. So, if you are adding PMU, it should
> > > be used by the BT node too.
> > >
> > Will move bt_en from uart10 to here.
> >
> > Thanks,
> > Qian
> >
> enable-gpios in uart10 is required by qcom,qca2066-bt.yaml
> and cannot be removed to PMU.

Then fix the schema (and the driver).

> 
> Thanks,
> Qian
> > > > >
> > > > > > +
> > > > > > +             vddio-supply    = <&vdc_3v3>;
> > > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry

-- 
With best wishes
Dmitry
