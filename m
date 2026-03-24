Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94B40824B
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374380; cv=pass; b=G4GOSAfpOx5gZ0sBb/mr8BOqriiVQ1tWP5pEB4aomccmlodjrRorU+93z9LQ0fuGfRW9pvOcspVstiikQfEjp+Mt/9aD+BHlX6wBahIrFDjO7JF8ZKP0ptvoumke3uurYQlBjI/D9jQ0rF2S4ckzvJomyamwjtUy+x83UFV+KOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374380; c=relaxed/simple;
	bh=b8b47Q+qOlJz/OEQW6yvG9vPt1Vy1QQe1A4hV8h2/Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7ZKIi5Qawh2iolWjNdOaJZRNAcNPQElgvEemtIPYAwiBShfKbdTEPssIH4Cfa7B+rxWvdjRH7yg92iz+9rNUnDfVYNh+LP5zTu/l8C6cCUlpP/fyyLQvkdWlC1biYZ4DD3jbOg8Mjrn1PgXpXwfsr1mSlepuEgeisg6Lvmu+iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIYEKiq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0U/XcjU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIYEKiq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0U/XcjU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OEbgo52488082
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=; b=ZIYEKiq+YRCShknY
	l0pMIC5I21sKuB9GLHoA5vXq/PPt9fEDN9mmtgY7X5IgqbXhjUoxVWhQvGXfKPnI
	zMT7VskU66KVDPGMXGA3ghDBkTttpufYsYhjiAMjJn6WzGnDk7S3k2iXRWlSl6ML
	QT2AxfiK9dKipCDgBNBAl0saekpW1aMxHqULJVsowIgSMNIDHC3nSVIq+yphTyY2
	0BR6In99hA6snZfxjdB6ltrvJT6PxwaDo5kJc8spGZzUdwHAo6WRi3IQuFJ9N2XA
	+B1jzuhjg737QdklGl/NVqY4O5DxTCJxws2EvuxHbC81zbxrrzuK7rkCUn088SjU
	aEI7WA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvrtqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:46:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b059ab124dso55514435ad.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774374378; cv=none;
        d=google.com; s=arc-20240605;
        b=Ted0haBShh+A2Oq4RT/zJLvWwHlFXp5LPzATPSdDLM84kbVQf1NTUDdA1apIqFSeR4
         Aw8ipDpZttdff+8dC+fzrq1zBqnP9fXRzF1xAgkridzZu5jCXvyoq+CU1lDfa7rxr2MV
         QvIGPWlsPROBgFhv8NlGcs3cKfZVrYWJtOlEYj9cqqXDUZD9xYiwMoZBrvKeXooJriqn
         wHqK2EH8XmiGUaR+5X4xJVhjWYEsLxx31ZOB54J7EkBDU+VN1alihm1XZHKJ8gBPQEIH
         VdqeNQ8e98zID0C+twTKM1KWXmASBBAkfP7XfUbok21LsFOWCkUlfJmTT/4oRCVX5vg/
         Rk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        fh=oTx0ikTSJL2mp7a/6IpupX98P/WOymQbvg8Wal7ck5U=;
        b=kZ+eW9XTy62JSPHA0MDor7DUqojD90vyM9SwEovz2gwDVwzShzMUCbhnY3hKqcZ76U
         84Qv5VsHc0EN5W4Tifzp5/1//F6QGsACqJBUduW17LwnEo+GHZuD8Tl5M7qtk3c7Hlie
         EEJG0VrWDboqMWnr1UtOoNIO2j268klquNCz68jassvC3BtOmIQzNnc2u/QisQtWO93W
         MuWiVAYQ0h6XFNggjkC5gYonwrzkX2SYO1pBZiSCn216EkYFjkcWr/y1VRW324YRuJhq
         mVS4esjkCSRFKn2sFCj8AHNvsejsyiLIZpdG3f6QX/n7sSYE8mBe6MvlWG+ZSmGrxko3
         bI8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774374378; x=1774979178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        b=U0U/XcjUBSn2D2ySHZr4dXE0EuY3yOivzzM4Mgl36N23zAl0oCP2YVB5dItPPoSWNU
         sDtRAnF+RTvoyOy6jojroLxRfpVSb/S03jTcykwgM1lFEbUEPHEi2RjtS+46CH7kjVPn
         yFB7xunA/LGdvWyFdZlRV0ToPzsS+RJ5qPNy3zEUmc2G7ruZWtshNM3PtmzK3uG6IB8J
         R1EG1ejklgZ3EDbU6Lklkf39R9+rtYXWq/V+s4zU9aSxN88zuqwo6zv1fjWcy5DdB5fd
         IN7vSQUjI0EM1sbnkgRYK7/4OH8iGO/ru4nM801/YjD/ER4Lhqv2up29iwhBCVe6bH5i
         5IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774374378; x=1774979178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        b=eG/Mu39VHtGMIcXLj0xm6V4KrE9WlBYuqjcaay0NGD63JBSurEyAB1fm0auKiCN9tH
         UBMEvJxf8er2cnGACwTkCN6LYOdU6uhrPlOHpK4m1jr4zWb/QeuSQm2TE9TqyF3HPNX0
         G7pxRxgP16OPNEa4DIHNIAVryqTapZehhXQRhroE5Q9gCQOwD5fkHhmj/GgLoSpovFOW
         muwlQnkhPEpEh5EoxouGN8FLmBfQ7yH1FEFktxwJQCChn2P6OM81GIKY5yZOaAEn32ER
         B5r+U1hejWd/7sSrbsSveEImBz8eiae0bdCRcuYc7ZywA2kNJ5NAeBHJ317vZl+waqr3
         SGYg==
X-Forwarded-Encrypted: i=1; AJvYcCWbDSDJ1ekBajqX7rLddi9j310vz/62ZQtrSjT1pEN71Xq3/rZ+cAGQMDEdOgqIkXLykqO+HTD5fVQ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UT/iPXu53VQQe2+Ee7Y+a3389XdcQZKFHVfyfh0f6BF2OT6v
	DCWokZObI8OYURcLRh2w50Apxq1AShvM3DWygpIuCt7EY00Yx3fXr6fs1hH/WyIYGH7s+8UcMWs
	X3FLfXnEl3CBnrZWGr7MbAo7EkNpBqasGGyFxnAEZcxsoWDnhOpz3yPiciMG4MQardq8Mn1d5Di
	wg13pa798jPTmhIHwngOWJhyCLTZzlPpQZpZ5lYbA=
X-Gm-Gg: ATEYQzyxpTTqTKT50ApjgESkmw9uU3tnU3FkdJXh1nzECA0FTpbIkuh4Gryd4DHRX2d
	cbEa0viLWrRqbuJof5hKJW7tQKJnpb0ZRLiJWAIBMmCklg33yWpNSbSXNO/vEjeOhEnMwKF7vbA
	N2zLCTySvAPs8qu6GtgL62tucu+YadIHS/aD8x3y/pNTXDnHepzY8e6roWLmR+mXuQ+mHOs+l/C
	wwC8m8=
X-Received: by 2002:a17:903:1b43:b0:2b0:74df:3c4c with SMTP id d9443c01a7336-2b0b0ae2f61mr5141735ad.42.1774374377477;
        Tue, 24 Mar 2026 10:46:17 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2b0:74df:3c4c with SMTP id
 d9443c01a7336-2b0b0ae2f61mr5141275ad.42.1774374376845; Tue, 24 Mar 2026
 10:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 19:46:05 +0200
X-Gm-Features: AaiRm533bbibeblnLli9Os5sSI2o1oJJD6-ekLRbkQPKiT1MC15pgfsf7kN-Jq8
Message-ID: <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_0=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzOCBTYWx0ZWRfX6G8catsnuuDZ
 CZfj312lIVf3tNI3MgNPMdUIv3HNKHEHNQeJvCxqdwl6Pyk0j2n2w6G2cMm+4LqynewxnajuLmv
 pZHateTDrUfuPBPVsCerXVZ2ajJbuVRSpv3P0dnZO4jl+EqHiw8TsvhGPJDaDLQ77y0rIHBW+Ei
 pjUnuvu7rhizcpBokApWgnKijnMGseq9oRbo3kbzNov58x8Rh6EAeGJ5mQCLCV0QUAs4CnpoLs4
 5BPbFydmAgCbBvi1bfVs73qYXEsWD0G1h24u51CCBoYau1ZogN1/tLtrKPSTM2T2XXOjFC3Hjl5
 DmfzJC2QwDDrTbcMu77xJ6uhS2bFcoEKiaqAcvqcsOthwPv0cuGzceWOGZpI1Qz1GJZclBWemGo
 XVJdYTN3djbmTwFXExInUh0aCJiSKlsaRXPB5bQYJUEV57RbmXUqOpjtmLuMA0MziUAz9nXEEZt
 mpkCWiK5nWdAATpV4/A==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c2cdea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=50mKzVcxDfY0Nc3ExGoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YEWhagMchtqQreww-CZ-Km_LzB16v9xS
X-Proofpoint-GUID: YEWhagMchtqQreww-CZ-Km_LzB16v9xS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240138

Hello,

On Tue, 24 Mar 2026 at 19:29, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
> Hi all,
>
> This patch proposes a generic Devicetree mechanism for a USB connector to
> reference the USB role=E2=80=91switch provider when there is an intermedi=
ate,
> block between the connector and the controller in the OF graph.

Please, don't describe what the patch or the change does, see
Documentation/processes/submitting-patches.rst.

>
> Problem
> =3D=3D=3D=3D=3D=3D=3D
> OF=E2=80=91graph links are strictly point=E2=80=91to=E2=80=91point via re=
mote-endpoint, so a
> consumer can only discover its immediate neighbor in the graph. When an
> intermediate node sits between the USB connector and the controller, the
> connector cannot identify the controller (the role=E2=80=91switch provide=
r) from
> the graph alone.

DT is a hardware description. Here you are trying to describe the
software behaviour. Please don't mix those.

[skipped diagrams]

>
> From the OF=E2=80=91graph structure alone, Conn=E2=80=910 cannot determin=
e that
> USBCtrl=E2=80=910 (and not USBCtrl=E2=80=911) is the correct role=E2=80=
=91switch provider.
>
> Proposal
> =3D=3D=3D=3D=3D=3D=3D=3D
> Add an optional consumer=E2=86=92provider phandle on the connector:
>
>     usb-role-switch =3D <&controller>;

An alternative proposal: let EUD register as a role-switch and then
retranslate usb-role-switch events. This is how it is handled by the
Type-C-related objects (muxes and orientation switches).

>
> The provider remains the controller node, which already declares the
> boolean 'usb-role-switch;' and registers the role=E2=80=91switch device.


--=20
With best wishes
Dmitry
