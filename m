Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F13480DF1
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280287; cv=pass; b=jr5S0Jfa/b38TqxVHJrtJZam19eHok5vJ7S5Ul0lBo7BOwG5lyj8RCtND0rpTfweXIytEzdB5VKt+1OAsMkmJpGqLCjWtxKtkMxAtGry9S69E+309Di+RludfB8dIj4JXgyaOaxqSdb/RNGOLjutmjRmhOXm6TcgZbXrkJzsdHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280287; c=relaxed/simple;
	bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sl+aHlinis1J/jWKJ6y7yLQrVZffNDlCv+Ks1vMGF2yZeoQESyVNwLDz22QwrS2BUhZLQuGNFq3cJPti1JZ+JYIiGyrSDTxFElL2eTHDypF+T1RnPIpHkz58aGaQiY3kg+couw5jUoYWtXISyv91LVDB90w46PfOvqx69KG+Gqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C24xkZOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAYWIDqi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C24xkZOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAYWIDqi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681G4iON2531471
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 16:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=; b=C24xkZOBMHghNCgp
	nyLxCOhToHipUH1POz509VZqjpVdRE55bwYNcA+stjyTmewceb/Ue8tJ2MHHFet4
	NSQoaOEZiufK0e0j+eUt3MG7B5U72niCsVrQdUaffrj/G2S47sSZPm+9nh4iR72C
	Kc9hhK+GvWXvpmuY+dfHffN56dLMkW67DRnMx3/wRPws4mZexqIMXD1tfh45j+G1
	kFg//DMHpAdwnr8y1RADR4UFNcfsg5T+cJibI2rrT49f1opI3DnFSkn++bMs3mhv
	8CqDT9Mmurfa/d+f2WbsjcbHXOc1VK4pA0IVSVt8BuCSs5wAiIWlRDaT2F2bVVVr
	XGWg/w==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wp863j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 16:31:25 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c70f5abc2so70869d50.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280285; cv=none;
        d=google.com; s=arc-20260327;
        b=Ds8zPdagRx1YXAR52asY5yR/fNlA+JeR/tz+QQO1kFjbUj3v0kY7UAwNQhnbuGSYhE
         6Vkqoi1l6m4Q/64B6rA1SnssTnVlOT//5NmklJ6wschSZW/5VZ+KUDizjJZ8QAnYbCNb
         eyTE9jQYX6hSI05HIY350+oYF41TAe0hOmjdXBLMuqx0viXIEYyL/DmZjm7AN2UVK/SL
         BVyf1A8psePB12u4qu2Qr0Pecag8EMCrMX7Hy4VnowzyLZ/qkdkNc1x0UlHSzDebcjmp
         GjhfCIaBA+VYGoXc6isBraRPMXSg7Y2+H4v7YyU/KdLE6JLY+SE+AEiATrko+AV0y5dq
         QEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        fh=aoBraOaeVUABuxbrrIgzj/9+QJa3SnY/e2y+tYmEq4w=;
        b=h0wXNtrlX/EXOM18gw5/VKtmH9oeb3bYK9kjkIxBnuMasnv7GH8xwpNZdmDueVJRXi
         sVby3lGTzEKp7ItDlUFaaFQcNBLZY2Z4G26tJOEXOQdIjNhOM57yiFddBTQIpJCo0AG1
         O81cDcUfGhFspzzJV7FBJ+UY9dUg8NeuZnyKeqvJMCmY2TjxugA3n9lP4o2WSRyDuFaI
         9pcMC6gr1eJ+SD76HYuZd0kEX28cPmkrgpebayds+yJb3Vh+6+nbxDZ2UIUiSf6jOudA
         aHaTO15NazGjtp4mreMbusDAmP/3h7n5ALStMW07SAZ+RLZXEJ69WjDNLdillBuwuynD
         hnnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788280285; x=1788885085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=IAYWIDqi7UT7bLHY1iF2UgsOwAH7NVHaKxfGK5vsY0wd53GoROt0HE++5OSK9H/irV
         TQYueY9mP5vSTIrtt0g32eAQ/CNT96gnnoXkOcZmeVEJPslpIrdTfc5Tn1UJ3i9vaxlb
         cY+q+92PdIH2gZj94tFkRVDfncMPMo5Dv7X+NpuEEshiH9cmBMS3pE0liVtJ4eUn/g1b
         rYQpq1xWb7CvHObAV9OcV0EdKnDQhj5OHC0AXWRGTnpVG2sfSSAhx1TLNFVBFekNz6Jf
         j8XjOLsLtS17QscTmilKJH4NDE5l97T8/R3zird1NTIPbQwWJvEIBny96viYtNCUrQ9h
         5jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280285; x=1788885085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=qMxJ6Fk5yqEzWHR1nLr/RawSd/Pk2ZYdeB/DmiTmZduQvkx97XWfhsk2wPff3tj1i7
         ATBOR4YwzAtlu+eMNveqGz/v1FM5M/i5RFXl6BIPsdB8vFrGt3r9WjrEHvn2Xlce5YJ2
         pAScHnI1snJBPX3a8zo25/RAWT5pewYUG5VH4+jmnVx61pkf4gscRvOYEcm/Og1RmTOr
         6TCUUYQ4ihZ4cnIPOoCfzgN80yn4jl9rCjtCP8XfdEVz+qabLHdQPBPxaz1SkC/VfKpj
         9zBuJRwYWHSP06hMDB0rBx8XiMg8+uFU09i5tYSr3L7wUkPV1LNB542ou2GTLpzBlT8h
         wdnA==
X-Forwarded-Encrypted: i=1; AKwUvBxBMooFznO5XwX7Km1939fsLYkXKa4eNtjUfgRuF/rQPGlU2wHC6JNSf9Z8WvrPT7d9aB62952a1Mhj@vger.kernel.org
X-Gm-Message-State: AFuF++kllMpkxEezn9puC1eC6kwxo1nj61Xm/aBuvQZxT2dT07WmAf2u
	sP6QjwC5fFMfRCuydgqMThoSW0Ye1KJ63MDQUmYf6dwFMg2lwG/RpOqmSAaDb2JEH1u5bXfAYAY
	z+YKdJgFr+VIVrmv0yDh/Peysaff09ZWd9eqvC4MFt1evimlQwYjTcvNLoduhgRqFHFdCWwsCMa
	oM0VMJ02n6n+lUuP5+1jm9rrBlNHPpVVICuxNPp7E=
X-Gm-Gg: AYBFou3a2ouAVobyamseXHk12jmT1wxhdg7ZEr/Z7ZE2uXgnD1unfdnTth4XhDjNLK7
	HTSArkeh8nl5MECUcbF1dbAnVKV9qewLYtRDrwM2OV6vct1YszUzN/zlb6TFNX2/JCanQXSiVpl
	USnYvNDbaEpJzocG/u/tkj06bb1ywX9xJjcjMIcoYP+LG4YfNo0gPWCQguiA==
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id 956f58d0204a3-66f87458761mr2635340d50.10.1788280284839;
        Tue, 01 Sep 2026 09:31:24 -0700 (PDT)
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-66f87458761mr2635174d50.10.1788280279650; Tue, 01 Sep 2026
 09:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com> <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
 <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
In-Reply-To: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 22:01:06 +0530
X-Gm-Features: AcwNN1Uh9bB4S11ithQu0Q4MNVjip4sbUP9vJMJ7eTGO8R3TYdzVDu8Xors9K5s
Message-ID: <CAC-tS8DO4Eph+obOU5jxwfX99gZ5Jat0PpD+CcpobJip9rGW2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a96fddd cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=oDxv99porRbPmQQDQpgA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: jQUh0NKX0jRNAVxlkllV0Eh6XlRMAL7I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX8zmymC0xGoYU
 vn5GzNPuVAulftDV9hiGUgpGE2f3BRYEPqd2uo0Ch9MJ7J8vNBN6EVAmL9bFnU3MXH66EOvTbtX
 rhTJeUqnB/lQa2+VKPNgOKPbmn45hFs=
X-Proofpoint-ORIG-GUID: jQUh0NKX0jRNAVxlkllV0Eh6XlRMAL7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX+nHmwUC+6grs
 PqCtxXFbdorEFMqwVWkNKy6t14l90odHDYaOxLIKi4bZXLONHhMFCLYaZNRqAOmIFfodLNbLfSp
 1o72bgSwL2J+MmsNO+6PMvnhNFCV5XvJEFdrYoNaONiQUjUDtR0xTQw324dMv9o4Yx4UFtmYcL1
 3piY9r6ZJg0mYv4Gly4gUcAQ0vEcRLOdQ178M41w5WAHI8yBQK+jnrq98ifPZ5oZxBdxD3GZFui
 9PBtiCpLGDIbQJWnM11GoqnjRc6XKbzqpVz4fh2qveqJnR2dMjTWQOqJu7Z/gvCUHDon32EOFvU
 rO60Yfx3z3+lT02/HjW/DpWkvi6SmEXfsKT0owc/XZ0A1E4/dW1ZsH4OVwNw948E+YyFe21EZyS
 fTB77c5bPQHE9i58DREhoXpUIXohKfWYeTlVjLptWHp5Rf79E8Bs+JGMULlzMUlNvbcQYS0dNKF
 hhKTH0dDIIFgE34ztEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010145

On Tue, Sep 1, 2026 at 8:26=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 01/09/2026 16:46, Harendra Gautam wrote:
> >>>> The DT binding filename and compatible string do not match (qcom,qai=
f-cpu.yaml vs qcom,shikra-qaif-cpu).
> >>>> Usually DT binding filenames are aligned with the compatible string =
for clarity.
> >>>> Is there a reason for the naming mismatch?
> >>> The filename reflects the controller; the compatible is
> >>> variant-specific. This follows the same convention as
> >>> qcom,lpass-cpu.yaml.
> >>>>
> >>
> >> There is no compatible for controller and the only top-level compatibl=
e
> >> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
> >>
> >> And I already asked about this in v1. Why does this have to be repeate=
d
> >> at v3?
> > The QAIF hardware IP is the same across platforms, only the board
> > integration details differ. The binding is meant to describe the IP
> > generically, with board-specific compatibles like qcom,shikra-qaif-cpu
>
> The binding does not describe the IP generically, because bindings are
> not generic.
>
> > used to distinguish variants. I had qcom,qaif-cpu as the generic
> > compatible in v2 but removed it in v3 as I was not clear about the
> > guideline. Could you please suggest the right approach for the
> > compatible and filename in this case?
>
> Same comment, literally as v1.
>
> Filename should match compatible, as in this case since it is single
> compatible, filename should be equal to the compatible. So first you
> determine what is your compatible and then you copy paste that string
> into the filename and $id path.
Understood. Thanks for feedback, The filename should be
qcom,shikra-qaif-cpu.yaml and the $id path should be updated to match.
I will fix this in the next version.
-Harendra
>
> Best regards,
> Krzysztof
