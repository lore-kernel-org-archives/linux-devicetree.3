Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07DB3BADAA
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324068; cv=pass; b=LQx7wKfmXZRe8LeRf7QPjip0MPgVAPi4JJka208SuKU2vhYKaF7k1WOiW9LjDT65WIJIVCbuIMz3vOoxrSQ0i0LZgPdEIprsQ9p5Jyy3NtvU0eh/UG5PUkpRAmvifd5D3AjiqqXKKookOxpiiuXWOVTuKlYUa7PKCeD/He8wUpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324068; c=relaxed/simple;
	bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9F8Gwa70fghXS1TRnP1gsxFQC273senrmBvy+DE6kUerSR97u4jb9v0iviDWHAcS/gn9g/hHNPnKQPT8dvGZKzZkuzuiMZr2hjrRA4sZGr8YzLtCs2te2GQbIKitvp21Raq2m3vmxU61Du1p1UBtx5st+LKM9/arSESUpYyAAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYSeQywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFXRqJm; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYSeQywf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFXRqJm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM0US621991
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=eYSeQywf7FMxqrQk
	od7fVL+a15CjGgOjdKZ9JrJ6YgjM8H3b2KIHu1wZdwESi2mpqdqdk0gEILmxUiHd
	z7cILavNamfurl9wlRFX4dJL7LgBTviAm3kNOZa8ZsZNKq6RmiTRn466q+SngTqF
	MKkap1nUOcXGSGemv+DzXT+Bet7+QpfuoovnXJmrziUq3MPPtbOP587h5B7hJ09g
	w2R4AMcxbr/duIUgGGpmFUBxyAM+pcfI5jDVqBE584F72S/9lAbrV0FpLLF7+8Ix
	W6m3+2XO84Cydmp6MgZg4CdmVCBeXCk20G87YdSUah+HAZSPz3t5QClstxpP5fzO
	O/GUJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954gsb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 14:27:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd3213beaso78083976d6.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780324065; cv=none;
        d=google.com; s=arc-20240605;
        b=Ppb7LoPq90Ws4QpwJbTZaEXQe0EzLa5lgvol4ppX7bIvm1Gn7ygNEa8DCBglMRNDoT
         Wjv3OSvIQ1VaUafKJaX3nWCb5kqGeIDd2/s3wGA87joBwJZGbnTwA2lktUpTzj8JDv/X
         ayc2K5X1jG+3DGhL6pDTOebnHleLlVuPy20r1KFkVasoMBPhJ0bKWoggY0+tmnH4Tx+z
         sWFZ7cbs/yaSS6dejFWR86rxVPZf9dmjaupp9HL5jvC23GW3H/w3mBzG1ZZJv9YmCJNZ
         JEQNQauNKxkdlUGz4E+aJqS0jJ8wEMt1Jz71fSodyTEPco+W0OlNQohg8Khg0haP72LA
         azAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        fh=+A657jOHJwEAqQZPydRYei7GpaT31JeWZKAMv2Ksdak=;
        b=hcW9Nx2cQM4wl/4Y3raQcaA/1oUpGRLZcBJ64rDw/yFqxKBqpswjCG0SC+LptY9D5X
         MynxqX+NNxI4Mu8G5Bik0iaCEuS/WoeRFQa+c4cm9icNJ5HaZJg6a9M6S7vOyJq7YQAQ
         6gH7H8+TmxMFwS87Y753OKk1M9VZa+5umtBJZnjnlSgm46NlgSgHrkOzrw9T4/RS0phK
         QXCzDOmRsPE1en3k02xI1Fe52suCWL28ALWR6C5cf+s1miSoJmdaFf3VQ53DPR+nG+OQ
         NxA323rQMLK0IBzCaXgwB/53+MZpUnunHYRG70WMp9TZnSZ36rXsBKC7YlY1DCw8Vvwz
         CHhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780324065; x=1780928865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=ZKFXRqJmBAgulbKGv/wfOvm/maOrMwM5ZsLytEhBL3KmJheLaHVfxANoL2gajheQoN
         /J13EibTMuOnY3eUnsuEfBlPSdSV1RxBzNmGTGR3NLyegByMwywSfiL3FKDqdqeuTg8C
         UjLTvMArxtHbY2OZUoQIut/vZk+pedCwq5++fBgKaAN3x0Xevp+ed6ljzAX7FZiQ9CU3
         ISbQMFZZLfOepM2Ln2zuwbW9K/Gdltfj1u0UgHqOc1Av2wKswalFHvI0ZbA8c/V5g5Lo
         LivHI1DF19JnjWNAOq0IbeJ6DBA3vbHz1ul7nxM4yOh1VuWjSgBk8O2aZ1lXQQPeReQb
         lExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324065; x=1780928865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=A6Kqq4LtY5mi1BZKy+L9QJ85+Lsty98VnzatBO+zQb16K6oc+ko2hREi7fneb9uFaz
         Lcb8WMGLU/d8XnIg+7vfT64JL+xxzn7evofz40YP8rMeIdEXx3eDpIUzdlkPcjGLA7ln
         ysr53uesMq7TJ1NlSca0ZQUlw2GIeLpmxywcYZtHDlXUnkMm41MuWM8SA2lCY6pTCX8G
         BTGDudhZAAGprKNoXreNoQPCcHzPeRYcUCHo9+QhfjnJZPFf5pGCql6CtRcibQfzmjq0
         IKlCXqq0EyToeUkARdpdoh2wzhuj9wYcuu0EVNVsg0qKacG3Au/rVnThHewJg4E737u/
         sKmw==
X-Forwarded-Encrypted: i=1; AFNElJ/db1nt13pJVrEgZocZQTjEtkecLVir2/gmarmJ+fxbhoKZ1/0sCZIiMQtift/f2PRKmJdBuNy0SXsL@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzMivPuhrVvLZsn5kddFyQBGSUy3wiPhN+5OhCHCkI/qCD0/4
	NLv7/43/Ovay952pHyyKTZ3fzkadiPOhr3Y+1mOipIKnJcvg6y/Sx2+BHHpvq+TzWPhixcXKGzx
	fFObfQP7cZT+Jco/wLpHCWH/b3uHMC+lPk9UEYt60TkBg3gLaSlHLieNvFnMP3DM6nY+qMuW73s
	Y5LD55x+Gv53bl320185azCloCa06bsg4OfiajHHE=
X-Gm-Gg: Acq92OGo4uvo+hGoSe2Q3a8EQfQXxoX7wc29gT45QV80Gc9IU+R6fx8B421jtWl1YjM
	7ZgQ0bgkzoSU1DZUl58XhFxU3FiskmEvbVnLnIQBMOLvvrldBFBCxzPq6IJcVrO8JS6sTCpYaFU
	fK7BW20QTxpmSDzPhbJhms5YF1yOnh46fw8z+C6SYjYn5lWDWY8AaZUcmkAHOvcIDx/DHflqVwj
	TbfjD0tTPwndqB4vOJhnERiD/GoxZKkM8mHTUGYSnRRLQ==
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id af79cd13be357-9153d938aa6mr1215098385a.8.1780324065136;
        Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id
 af79cd13be357-9153d938aa6mr1215093485a.8.1780324064677; Mon, 01 Jun 2026
 07:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4> <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org> <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
In-Reply-To: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:27:31 +0200
X-Gm-Features: AVHnY4LtL5VPWicujYWGAL868BWzmKvPSaREWLjiMCcMMmubijXxiTOJv64_r_I
Message-ID: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3hQZ5DJMohCQDONDlX66ZO-mZ8TruXmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NCBTYWx0ZWRfX/NrS8JonZIsa
 czdi70Wxo/jqU1v05UhTFJsmVRBoxb3uepf8PqkTWtg/o0VsNILbHe/ZZXmIb9YvMH/vSqsa6NI
 ll/sC4y0R05JFHa5RK1wNCnkqHmRK4ZBiTLaXzGBeKPVEF0PZp5Fe2VoM8lzX3CcbGDiSvRLQPe
 3PRAap6EWEmwqJ6/bkbBI2lVHZLSTGGC+cTfNEYKOjtFSwtMDLs/bv+UG2w3wPk4yWEsXxZw+dc
 P9De7ZJxBHbiBkOGfVUhZU+UB5TSrYgdZpxdPE4GJHybjMuE3N8EcSedJj+KfMPoHkk5tnuMK+e
 FYm2jTBFVn5g6ntg/YU5kURgU51xehpxIEucVweJOeaolzxBSK/LNKUpwRBqIC91J15dZ4xUVH5
 bEOyJLFqMaYqntg6BBWMJ2uS3bDtV60xO0OLicCntDuK20YCwktBdPQuo2HxQ6oJlo3dbidpJvm
 rCYiq7kXpkFt2ex1C7Q==
X-Proofpoint-GUID: 3hQZ5DJMohCQDONDlX66ZO-mZ8TruXmk
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d96e1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6RP30FUjIQ2jcUxmk7IA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010144

On Mon, Jun 1, 2026 at 4:15=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> > Here is the full IOMMU SID list for both platforms:
> > Agatti (QCM2290):
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0800 0x00 =E2=80=94 CDM non-protected
> > - 0x0820 0x00 =E2=80=94 OPE read non-protected
> > - 0x0840 0x00 =E2=80=94 OPE write non-protected
> >
> > Shikra:
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0600 0x00 =E2=80=94 CDM non-protected
> > - 0x0620 0x00 =E2=80=94 OPE read non-protected
> > - 0x0640 0x00 =E2=80=94 OPE write non-protected
>
> What this tells me is that the Agatti binding is incorrect for addition
> of OPE as a separate device.
>
> > Only VFE SID (0x0400) is shared between the two platforms.
>
> Both platforms have the same IOMMU list, its just that you are
> correcting a bug in Agatti's defintion.

Yes, Agatti is declaring too much if we want to go the camss multi-node way=
.

>
> Again only IFE SIDs should be included in CAMSS...
>
> > The current Shikra submission enumerates only the VFE SID.
>
> Great, this is what we want.
>
> I think for future submissions we need to be commenting, naming,
> something each IOMMU entry as we have a problem now in Agatti and a
> legacy problem - already - in VIDC as a result of misallocated IOMMU
> entries.
> > Should CDM and OPE each get a separate YAML binding like [1], or
> > should both be part of the CAMSS YAML binding? If part of CAMSS,
> > please confirm and we will add their SIDs in the DTS in the next revisi=
on.
> > [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-
> > bb1055274603@oss.qualcomm.com/
>
> Yes I think CDM should be a standalone block and BTW use standard DMA
> APIs with its own IOMMU entry.

Interesting, so CDM should be a dedicated subnode as well, and not
part of the OPE?
Then, If we want to use it from OPE at some point we would need some
'cdm' phandle in OPE node.

Regards,
Loic
