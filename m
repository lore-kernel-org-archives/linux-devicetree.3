Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872442;
	b=ubz2maf22I4ZbsdbUbMtYE6wgH2L36slgPZTYXcJRRXIvIkrJYM7G11qBd1kRj38mJj5
	 h4lB/WQn37hd0hQSII+OKdantGzsTvGZF19BQQsdgqIC3Sdf6AtvAA9WCQA7n5zeBbwae
	 lf6vUTCZ4z6coTKzwFeFNKwSu/RtVMM5PhUbFva45LgIHBzk8r4Yx/ZHRL5rOX1aAwkkZ
	 ILRhbAjF6l1BLqzdSi50KWP5SLwzMqauYp6/U8osC4LoIJVXMAC8fAwMEwE3WYA8LSsnu
	 VxsPabai/HaVALC7FUJAEkYuuILP5nvfZsy8CUrbpg/2a1BOLKVYezWq0P6zI4jBgHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
	b=cafd5odQylfeFC5zEtiFD8r9O/e/Mvx4LvO4BoPZ8uy/x3K5CH95EOGOlgO4cjRU5Qge
	 0ODbgQzgKwz7fh2fv/QeRNz61fqfKATYDyKMdcoMiEcHfD7I5IuJhxF2bg+Lwls768BFY
	 WX0Cn2gKPcqOoaEKLe8UQW5EWrOpDxq0o1MYEjXD5G9GSLa1iWuieHU8O550tYrgMtHMS
	 /Yor9nrH10GsaRB8rVlqfs4u51rJEeWIfm8fkuG8HWf/fhHnlfJpC+yiN+DWqysQqTDxC
	 ZY1R8lrVj2H7oxqo+KrIs2t2mOAm7QQIsPJWIqnkGxlzIXaxZySd2iQ0xGfR43ZVkbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA9606CC7B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9AA9606CC7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V3km2588427
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 09:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=; b=PdS93n0NNgqXZtEt
	R57dBU/Xr1B99fPEJdtDFmIU0VEwhIhsMe9LL9F1xyNed5u37biEgI7O1Xv+9542
	mtaPlbXp+PhrtKqdh8Wf9I62/m1pdaIUoPcpoB47n009CjqpwnzuNDr5idqiKaxX
	EEnFtRDdw27M7UlyyBgr5wd2DLhNb+KlPJqTuAMVf6MKkDhxYSEcWS1lq6bITnhu
	/fOfD0roldZjH4WsIl4d2BO8R7lnZIlDcOggr5g8CcktrZjFR8Q6ofgU9/1AFquB
	hwtr04M67SU4ZItU+DnKIDjlRtVqXYOuPzns7acCvaovHbdrhk+dJ02JtIa8j9eT
	1AfF9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suvq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:54:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso344863085a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793872440; cv=none;
        d=google.com; s=arc-20260327;
        b=CyI822vFjCuw94oKTY2aPuZvnPl4SMjM/P8r95I0doxMtk1RTwb5Zn/3tRD4QEMvo7
         ylwSoU1eKWC3WgRoOut9yb3jNIHiEB1bsBaQdcAZR3TJS+bAkMfD9uSURQDc2IDdHSnr
         tckhcobg3ONJ2Uvz0Eosc1d8oIScShZ4QxjEo1kOtgVHeWgRI6Q6C9ySIjok4ywiYMKi
         GFZ/nIa6eDp9UbEt4HlD9RIC7R7DN7oxgnOgm65XJ+jxqRzdwIpTkGhkJaIPyMThCiNH
         ZkKS8s5LmvTV89joqtCUgPxVjhJdTuYxZd8kCKKuq1gUMDkcORKJWpNMXpTyaDAYzOWg
         IJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        fh=xoI1LRl2Hiv0XL7M/+5nxJNMIzx9eI0UgmDR9/eKUWo=;
        b=Mio2zCICjH58+oAf/FYXOLIEhVpzrBUiyUMXUEKjbJwF9Apq69RTpkrr3uRucu9x7o
         4OjUyUUa12lKWz389hIUjWbMQt98v5bR4sRkikDtda0BZAIPkWt4L18YSKSfkTLpEb9v
         Snm/epODpqvGFSv+4W63QEqVjKEQWMqgMdKh3incIjgURrWanNt1Fk1iD/XdAglIz6Gp
         DlwUCiqVylz4YGdrD5ZbDzsIugNCp1hDWalFF3wT9FEf1wRGmjtAJOr6MaqnRdwx07ah
         pSOjjpFAFv2+P1VA2rPqlQnXi4c6NDULm3VQPazgjJKcw/6iBb+dXf0jUREcHgFwV3vW
         jBVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793872440; x=1794477240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=BwVxTQ+P1kukm4ZK5AN8CpaHVyt0nkzFV21eOEUi1UdmI1cnfPrRf2Dus/7xz+/5wn
         l0aUh3/IPg+UT6m7LAnh22DL3XNlj0FJieUFCFQRlF0UzNI8EvWo40M0ITejx3PfDuMh
         nLTSmPSC3Mm2T3Q2fi8LPkdlefer6BL14Fp9OlbzQaWIucSmzyRzJIBIkh8rwfRpiRQs
         VP6d413BRPvH0ZhANSo4i/1fmafzxfR+ZRyU+ybruG9F4DIKw+NVkpM0VfLrPMy3Mqu1
         0OFeB2BHCUq/lv6El4uqJiHFcnUaebQNK7HxwD7HhTTT5OqrHjIqAQRvHmelGJ6hLkQf
         1Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872440; x=1794477240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=uV2tbUsinjwO/qIrdZE6i6ozPlCSDmiLUSbyLv6aG71IA+37HwzEMNzhfD3vXrNKtS
         zkV84mlsXF+WpyQdzilJKkr2qcW5vQ3IqClT4TdzyOWa/uJfAVTbhM7hKXQMQ0XlpR6L
         f/sQt7kI+OpgarM8Cu5tnpMZOtZA9o83iDKCZEYf/5wS1gHRtIY2yoCrfGOD0DHf9jG2
         eNB15c8SO5Wu2gLTHrglnp7N3hHdcNllXgyx68veaI5QAGs2PicsKIo67y9f1bt3y12q
         JFV5AAE2ZAn1Be7JAgxdzZA5NC/ikBmDmjTzQ8zz6f9BDnRaqZshLiPsm1shk72sM6AM
         yy3w==
X-Forwarded-Encrypted: i=1; AKwUvBxaOh7q7MVHAHevumXRxdzRo80jHct7VewteYRJA5sTBN3KYJ8Fo624z+aDXNxi3sYuA93Bn3+LieZn@vger.kernel.org
X-Gm-Message-State: APuU4Z/EwaMo+A6jpNMMlFMlx0YsaZSxtU0ldAcPldQKxVUW+hcqC/vI
	OPIeCO2ME0ITrDWjIJ6pj+g0h1P29dArnMJvobo/fc+vXoyiNWYfa2ourWrQWCylE7yPoGtaA1x
	qIYecAQDvYpYdBWeF8dBnA1J8ejX+NF7Kdd4pVeFrnTiNqMkqPch3KnRJq3flnUHGlu68c6BGA4
	vOZ+yFugUtJewudmQCxjIGbGsNesr6vTy60F/Va5Y=
X-Gm-Gg: AYBFou0Y+J87FQA8NvxVMiK75yNjeVU/p3fznFKlL0ylJ5XswQf+dQRKCnigQob/T+8
	tidd9PHUfeMcAav3k3ypf2//TjHn8kJCLunyrh/dQ0G9jmE51oWO5a9K67nq9eQSCMrOibrc9AF
	+RCFviXU8z+0Lzeq71Q0YN8dPZ9AMXTuzhLC0GAGejZwiJ3qN93m90dT0f2MvV0JMcg7AFS8/LH
	ClVkauWEuenys7yfc6pIEpbIEKBMuFfVBORHQnIjbq6il0SAKjJL7jytGCl+xEaVvOvwqej43c=
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id af79cd13be357-944217ef445mr2800703685a.54.1793872439958;
        Thu, 05 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id
 af79cd13be357-944217ef445mr2800700985a.54.1793872439407; Thu, 05 Nov 2026
 01:53:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
In-Reply-To: <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:53:47 +0100
X-Gm-Features: AclHuK-5GKF2Bn_LCpwzmtoIhVOQ6DcYBmDOLa-YjfFfGok3ouqIdaX7kcvwdAM
Message-ID: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: G16QU-nsQkcAHpEOPb5WBy1u1UkINMrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfXx2fDlp2GilP4
 VysKSaHicfY98usfsvEI6yCfiH0XCi29nuyBliTCWk2XC9Y2hp6RpkbpITJQqCdBCuhOMg2Kyby
 gdRW8dQInw3shpffQjb2SoL+puKC9xz19bHnjrc/RRezCjwS6Y4zX9Q/D4AOaaGYwIy+OWPQKh9
 m+M39HwD/gAr6nBESoQ17Vix+O2rk+hs5YmbeE7S5MGQ1w4DFNGzfbIhtbSxkfSGcbqbppL2rzO
 iKt+A9P+8BMwlUdjqmpXGgh9KJAijf7c8g5WmDS7yiUCp/QPqIs6JKRI+vJn3u6vo2XbPLc+4Nn
 fIw5RO3QG7vh4vL2SsdSSxPKZwfEGVyQ/8kqa0ZJO1siNOAuz6eKFP/cVWjApT/ggeHkL/EwIAi
 IugL+4eOGAWXwvGIOH7QZY2gsLZSwdfb3KlZsuWKKoRCZIo2abMkts0wj1pLRGlXKzUeyGp7PKv
 qt5WKwKB7kG/r0GtpfQ==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec5239 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pbMnnzsb4hIrvCsJLMwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: G16QU-nsQkcAHpEOPb5WBy1u1UkINMrY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX3nbNS9ZchXvA
 uEDmH+4kJqGnBNfUo3M75v5SkAJ9ZORZlfLC1YFCo5RwvmntLWiTrMwJEqrE9st53qToFA22WAI
 2Z9w8gkVwPtP3qefGemZ5j6cJ3wACHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050039

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
> >
> >
> > On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
> >>>> What is the problem exactly you are solving?
> >>>>
> >>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
> >>> graph should describe it as port@4, not port@2.
> >> Nothing like this is explained in commit msg.
> >>
> > I will update commit message to explain it better.
> >
> >>> The previous port@3 description only worked through the X1E80100 reso=
urce
> >>> table indirection:
> >>>
> >>>   port@3 -> csiphy_res[3] -> .csiphy.id =3D 4 -> CSID selects CSIPHY4
> >>>
> >>> New standalone PHY path:
> >>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID sel=
ects CSIPHY4
> >> Then this breaks existing users, no? Anyway, what stops you from havin=
g
> >> there proper mapping?
> >>
> > No existing upstream user should break here; this is still part of the =
Glymur
> > CAMSS enablement.
> >
> > This follows the earlier discussion that CSIPHY4 should use the
> > CAMSS-side interface index as its graph port number:
> >
> > https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+=
gBT67AdQ@mail.gmail.com/
>
> Should use? Since when? Do you have DT maintainers ack on that?
>
> >
> >> Did you find any existing practice of numbering ports logical numberin=
g
> >> in this device, but some other logic coming from datasheet? Where?
> >>
> >
> > Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are n=
ot
> > present on the SoC.
>
> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
> no? Not fifth.
> >
> > Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY=
 mapping.
> > port@4 describes the CAMSS input directly and avoids introducing separa=
te logical
> > numbering for Glymur.
>
> Seems you opened a new can of worms, so this needs proper justification.
> Again, do you see any recent preexisting DT review which would help to
> convince me? I know I usually ask not to use poor existing code as
> reason to do the same, but here I actually want to see proofs of current
> accepted practice.

So some chipsets share the same IP blocks, with some block/phy
instances disabled. As a result, we need to decide whether we're
numbering based on active instances or on the actual hardware instance
index/offset. If we use active-instance numbering, then yes, it should
be @2 (CSIPHY4 being the third active instance). Alternatively, if the
port numbering is intended to reflect the hardware instance offset,
matching the register prop, then @4 would be more appropriate. It also
has the advantage of directly identifying the underlying hardware
instance, without requiring any additional driver-side mapping. In any
case, @3 is incorrect.

That said, since the bindings have already been merged in its current
form, we'll need to preserve backward compatibility when addressing
this.

Regards,
Loic
