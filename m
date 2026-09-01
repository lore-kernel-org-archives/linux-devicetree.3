Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D402FD69E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258658; cv=pass; b=HQwh/yq3D9sS59r9EtTC6C57ia4cDdMqTe3bISgW5uSN2cp29i5hqrD9YjmU5E8bVcCguCrEViG1VK1o5gCmKjbNzpyPH0Q/DsJmHHm07Y11OO1jcEFBmy/d7Wdq+n4C9rQ3iJOQDs/FYg0sWqZHONYNj/9igig2qdwpagIXH3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258658; c=relaxed/simple;
	bh=lWFns13aUQVRLJ9/uaF4B2fLPnX4BZA6Ycqj2XWx6wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/H8RuwORvav1CBjKah5w8GJ3YYfsYhLGKbLUBFc2b14FB+l3ZdCtwgqKAFe35qvxwF1Jl1axH8IfXFnX7yLhzIDSgKYQd/j/RMe7QygjUB+e68pY0GJEqDWhSnZdnlETZ4/U7q6gfM2Jc4k6+aNqX6M8kDfX1HQQuM+onzwpzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L24pVZ/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtHS8hE/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L24pVZ/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtHS8hE/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJc1Z2141622
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=L24pVZ/ZqR3UqxGK
	/67Ss2CEWxRkdLC3ayiyFTGUoXWpcWN4OwFx0jrQtRXWn1FW9W5QfwLgb8KTD0k9
	VXA3inANCmxJRdNG1TdFzjqDC2lkfvvladRHjVG4IrE+z65E9aAnsEQTGw71IFRt
	Cth5Kl1JLNSIKsmyJW5tOWNTFgYA2eaAG7rmiTDyTpYah40uhNhRnI9nNlIapDXx
	tgGkDMaYbMwGfILTDIdpdgjsacyyIgftl8+InQ7uxVvbYahckUBUSTutJog97nUF
	ICuTYp4BAjDzqlVCXHjSMsyWarzJJVoGX2cpKxi1M91rxA81h4lNdrgCFXIrEQUf
	kNHixg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsssj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:30:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so6346737a12.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258654; cv=none;
        d=google.com; s=arc-20260327;
        b=M0AnoatpCF/V61qWKBLFck85kdNmjg/WrJSEcTd//f4vnVVXgmBQsBJbgOMFGWmlJq
         NvE8kEs5pvRXyMAomr4X+q5bPZCaPvI9QKD5tE1w18i9ddb7UJfMoTHbCTr2jqs4ENtg
         N1bl0JVej84KVDZSepVU3LGFhUpBqMEuBNBcLsWjiVy7yDVb5loxVq1Ym/Z0Fn6GEn6x
         uQxsbzC2VenOaSU5S95ZuhbSqTF8ANruhA3Enm4PshHXZ7GJyV6OtHRHJsupWOxYC4Cw
         Jv50WOw2AxMSco2uykJ8lwRDb7c1G+sSH6g4zbxhmpObtN9Dy/ttOyZLsdzxkXdmwoNI
         Fseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        fh=5sQiTD2FKjQtEKRAyyyjOod1GOfT3ewGQfuRCTxpxzw=;
        b=cw10LsCoNCDibAkW/9c/iaN6mKMQEqCSKs7EtOTsUAMZYzfcFu9kLF/jCvrUw6BoPI
         GyLzJtMe80sxW4soJy9nY+4Br6WmjaJBxGLPjzbvR6+udLJxBfNK2AMBNQZuE145Br/s
         oJTeRZPkamMh1UNWIVl5yDMBygOHQRbmdORpmONtf37Z8Sbw+2XytqIbGm2sWpBTWuO1
         dVefomrT0SiqViceKu4aBxixgmJxF+sMSAi2Acq3JgezqelJcleQ1OS7leAgB8vQt/H2
         f+dG/w61vpDJwkJtQfTsU1ggRwxhSrSdfJBTpSpC1ooBTfmQh2xj31gd5BHWXbUV/+3f
         TN5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258654; x=1788863454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=JtHS8hE/3pslv6128ea48f3WQ7Nd3FiXSsXDYcy2WqnqUxjK651VYiOeQE594/us8P
         Ml1OLIOZFFYiyFcLs6IlwIT1PFYj7I2C3UsgiqswWOMRlC06ANUSbNwgEllz45OQa2c7
         LW+xlRuFZVwmuL6GaoDNzqINWpugScm8Wx4tZ5H7M/UhyCwRu7ezC7pdDWsbHZkG5Iq5
         IN72FW5bBT95B2cpYGMKm5QStpb8bg38SUU1SL6KpmFmt5sFFNlwdMoyCyKpBSSNGPYx
         JhaL8D9K3Qv5JGhAqep2BaX3Ba0GK50ijiFF9w2bcQ6zj+tRlr1Man7b0nE/hwyMxj0+
         wubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258654; x=1788863454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=Pf8hdphaltiti4XWAwbv/xwHjod+BvhLEgIHDuCHRYGDBpOkJXt00ad3ITmJhacYvk
         iJBotM79xMlXFUN7z70Ij7fbyXD4ej6t1JWwZ+RfWDRXjXsohHQ/WP8Ej+mDJNlWkeuv
         esDCVbTV5Bn5ty8gUcLE1Aj+e3J+quaYB/EIX3SggOM6lNcbychv/WOJkG81qS37amYS
         qMwy2MvVEXoG+vcpikal6tQCrfYJTNjk2GRESJmLeIs/0FbadwyVIIiC8A26sJ/e/a43
         Uob0WwzffsYfW3QVNRosIZ6cDkzZBZ6HxYEXgOZhqOHA3BTXK2GullNSjW7XyFRYlFmF
         HoyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKTTP+ItxnTBg+SEXtFOIJsAVCI6ywkQdSc3kC7OzeIxAj/qjBQz4p3wjzpSogFyEijtDZtnYzxxxP@vger.kernel.org
X-Gm-Message-State: AFuF++k150y4953/sX8qRgw8UVZERJ8PsnPZwX78RS8ZAl5KSOPDEAlX
	Qo/qDpb23CNf4oycYvCKNuv4UxSAuTgEEoed7rXpOVCRZ/1Fp+ft1RH27W4wRTYQ5bOEjXcjdm2
	vDUC/+tVMdkbMAwQkTAkiWySG/VGwpg/2bZBlsl0STU2ot+1RdZu15/2S5DkjRbQAvwDKV63/H1
	sOv1qo2DBOUjnWoLfo5Sowki6FRBOPe5Ln76jbaaA=
X-Gm-Gg: AYBFou0sE9v1EB1CDfOd40c0eUexoV9bhhHHrS7ZkRXhZr4MqNQ7M/plEFbw9x0txjK
	RG6PyWuL0ZjP+9mNRc3GoYWwV9Mx64IFRldUBCB43lYAGIVP6WQMzCJ4y9rRMQjh1ae5y8MwVTE
	Il8NLtt1FeXyFsyRhrVj1Uy6StU/KNvpvavGTDbGOCes2pDkbpIljlyMNp9g==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr48338181a91.9.1788258654330;
        Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-396d0ed8eb2mr48338075a91.9.1788258653663; Tue, 01 Sep 2026
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com>
 <20260827125906.GJ770273@google.com> <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:30:42 +0200
X-Gm-Features: AcwNN1UeB9u2F8V9KZ-ekpacU9KYz87Vz22k3R4eoK1r51ZtRDyRbVXuvUd2fmo
Message-ID: <CAPx+jO8XTr-C6gPRWA2t4TVCTdRQ8oquhrfv7vMmC1oV_DpcZA@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0cAhhBvjSWW4UDRvge4ix1I_L5lIPwO9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXxHc2Ume6dr+D
 Kfm047JYFk4WOzBK4f2DlEEHj8s55royAZx8aVvkaUAADnfRLU+0AqVtgOtwXQ/Ks+rEmB2e7k1
 fyppYAKkgOv8EWAKR8sQKYCbizdShvE=
X-Proofpoint-ORIG-GUID: 0cAhhBvjSWW4UDRvge4ix1I_L5lIPwO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX0lEbvQ8ZORLZ
 R6XBTyRTHl1j4tBrog72srBYQZMjNre328HsNKMDJvy8PULAxx1vvBvWy8n8Hl52MwTJdJEXB//
 J8yhER2ngiCtpY9zOU/T4O+tpZ7fUyACMXQMCLUi4bZ7VbKv1ubLbyATdq5X/pRYbc5ip2/Klln
 7nQ1t3jILAKb39hhVHLCPQ4bRgT00E1m4c+e1kmM8g8OmV3DUhyoNbJ9kmo3+13PmUDyBW88Ne3
 RV/PhTDHdHrwRHHhQP/OMW3pag5mCxCnFQb1XAu7J+GvqNPJAa9dap6rdKuzmyt9RyfdaTps5g4
 xT2eX1vj09IlWzaBJK1JgBNcgsvnbs7tEoc+Jrz0JtXTZ1nu0v9i5YQkSrPjvup4v5fz+7Phge4
 oCx5U/CcJswI2sd8tmeNMFzLGZQMRlWNu0M97PhMkZ9nzJcUZE7wxiJ30UdUfJ+2dxVHriA3LOK
 hr1zneFNnES7opmTboQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a95f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vprddorpQwRN7yjes_cA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

On Tue, Sep 1, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> > On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
> >
> >> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
> >> <ulf.hansson@oss.qualcomm.com> said:
> >> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
> >> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >> >>
> >> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> >> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> >> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers=
, if
> >> >> introduced, would also need to bind in the same way, leading to sev=
eral
> >> >> drivers attached to a single device node.
> >> >>
> >> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and regist=
ers
> >> >> PSCI child cells. As the first user, register cpuidle-psci-domain a=
s a
> >> >> child cell.
> >> >
> >> > I don't think PSCI should be modeled as an MFD device with childrens=
.
> >> >
> >> > Instead, this looks rather like a better fit for the auxiliary
> >> > bus/driver. Please consider using that instead.
> >> >
> >>
> >> Hi Uffe!
> >>
> >> Since I was the one to suggest MFD - would you mind providing more arg=
uments
> >> in favor of your preferred option?
> >>
> >> My reasoning for MFD was that it is indeed a device that provides mult=
iple
> >> functionalities, of which cpuidle is not really he main one even thoug=
h it's
> >> currently the only driver binding to this node.
> >>
> >> In any case, we'd need a "core" driver binding to the psci node and wi=
th
> >> multiple auxiliary devices with their own drivers, we'd end up reimple=
menting
> >> MFD.
> >
> > Ulf could be correct.
> >
> > MFD is usually reserved for real devices, whereas the aux is a little
> > more loose.  Please consider it as an option.
> >
>
> My point is: if you start registering auxiliary devices from a "core" pla=
tform
> driver based on real child OF nodes then you're basically re-implementing=
 MFD.
>
> At that point you're better off just using the existing MFD infrastructur=
e.

I think it's as Lee said. MFD is for real devices, while auxiliary is
more suited to split up functionality using multiple drivers.

Kind regards
Uffe
