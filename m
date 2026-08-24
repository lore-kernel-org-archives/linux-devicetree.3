Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6133A961B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560332; cv=pass; b=SS3JpnpcBsIIU55f8w0FIadXAMtVSj6aB0VhD1+64U//ZHMxmiBVGZnzeQfltqFJCowHXJ8CyEswtq0y7aLYiFTt6dqGIVIu/Zb0XAIa9tG4bm8BNjLdoRojkCy+MudQ48dfmUXUFgTtHlmUSHkMcnCU1pCqZlaAjl4P4sfzYQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560332; c=relaxed/simple;
	bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJYOMuW2I8hRFeKa4K4FrF6kjNdcTuMfJtZxQ9SAa0hYQlvQiaZr+xWrOGbJwdElsa3beCwpXT34H7nTDCV5Qa69BN28tpIiIt0oOp5/lG2ugKNFEbWxIVNsGcdQNCprVN9neHwoV76S8ByzGQouV6xNNmP/WOvO1C/uU7ByhaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAJwJ2fH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch/dNEYv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAJwJ2fH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch/dNEYv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCjR3066897
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=; b=iAJwJ2fH561V9pOv
	E6dSfmmr1qGjTpqQqSRLdKecJ5SNx5MSh7DWN4t3qtgSvuP3EK4QDBvmWyY1P0IV
	6Leq34ru48UeDrSKGCi41bLjrtIiqVshbAU8ak5qACs0Qrbi8eNZjFb+sNaBExgs
	WJ2k7qYrEiEcAIG9hwKVE8TJIEKvX8mJ8aG6Pz1ko78xWuRJTUx2POUYobPhsz2D
	ZAhtIy/g4Y+xUg2ORsybLpEH8en9AgKTmg6WcXtyj13FL2M9aqTbQH//xDEExnDg
	CfcYc6KTNkNsEfwwFI8JwcS39uAdRJOoT26kutXWXQ+RtVD0iP/4wex3dVxVFuoH
	B7pN7w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphpa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:32:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c416b236so72757577b3.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787560329; cv=none;
        d=google.com; s=arc-20260327;
        b=D1Ubd4XC6G+YBHyhm0UAwndkP2+XogPSFRoN5wvoonQfO76lkk007+OSiyqN0sdryu
         0knNxjlo34DHRw/wLp8dmoG6dZEWgkXN4VWsj6SVJ6aXrXLrCF3f8bWL1dGb6KG5wRMQ
         2qHZClVJ7FasweIaGstwtpiTyXsyeRZVsOguCEYVkiGBaGqYHAAH0zW7+EQLxKZNx3VM
         t08IxW+rVt+YuEfnikE8cOnFdA1ofD9yguePIdR1ynusE0rAtcmTOxDE4X+GclGmbwxW
         Ugfy6EWMupdkrXCAH+MwdRQbwQOX6qbwxD14b3GkiQ+9AM7WxV6QLfuEt0K2slHUkyKV
         8y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        fh=xZvmfuG7jKiCzCMdlxk/B13grAVYvvOnBU4axoc33jk=;
        b=GniORFV7xzlKe6TwzYK01F01LR9uXN0+s+auaHKcmGMuHQf53+ogy42dBYlwjkKxYo
         JuWxzuKJwWdSudr2shHY6pc4cEkUsCJZu8E88K+n37XQYPzTFB9Ht1gXYw3vinAxgjsv
         gHv/yXV4+lhSjzT3TU+k+rxTFayNIGG1kvGNk+o2b1jGdfOP12G/sFP2TTsHQpbR0Ldi
         4/veCY9FrRF0ClU9b+5RXB8W1uALz8wILWSRn6txpTGNb4W4otIW4pHZvmlJGxXOr3fu
         3xUtx/x7AW7tiu7Rey8kboQgyTbh6uBr3rzah+xy/2qUW/Z5t4MejUJ+LLMr5JMLBwiC
         o07A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560329; x=1788165129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=ch/dNEYvQSSUQhqivtip8NZuorp8nMEc+ksy/ni9fwVnonyPEimzTQ36UVGiNpuV1T
         wUueNVocWb3YHV7ksk0NUIgMscqeXNzxMoyxhUMW86symiZLNbZaIzselibINbcIN974
         0tH19hKcmLF6FCyZE1m07WkPa8ItxQGTpllsYYr2/jN4qhZLmm7jG+g1aAuaXn1snWTB
         0qiivtluTKfFdp3xYa85jg+Zs18lNWTHZDxG2X7eYeaAk6/GdML+zducmO6KKVuN1drn
         d/sucb0gE1K+3tgKKdLkehphdd4cSCu7bUBd+JikKq2qkRv3KhhW55QBO8HduWJy8HEP
         hIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560329; x=1788165129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=Z7B6jiWSpxTPYy5zts3nHuUKWKZ0erbKyJ70KHLxSFdI4EzmpkCA9opQ4L4mehU+My
         7WwD1NNP4rOppxg7R5Pv7n30fNkedSZXHiRSIaoivsEcTW90BFvZWKnhoycnvev8bL59
         RtZicKuS0K0F3sHErSa1i1KC/3pEYqZcf5Xd4FBaVYbCpjojFfOznIrOG7J/7B78pCCV
         /sRJdaYHXiXMi4um0TS3hJdHquctyV0yr/BPmM6lo1EqEtU9w0xq4S1HQDvJ6V+k26bQ
         3l00jWdIqRXNd1gKaq+jIJRSTe8iaWyK3+ua5tzNmr8qHZNqzSSXna6OIik6XEMgOCSR
         A3Fg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6BTTqLBEbLwEkuAHw4ec0cI8IxhPMk23k1Wj2OznIesA2qyxuEZbi0O/62QYvVSJYV1W9e/NJ1NtR@vger.kernel.org
X-Gm-Message-State: AFuF++mS7dy5nBHPJwyKCEZQReQK6NZ5CKJdWQdN7wWMNFQ3RYStE9Ln
	5YcFTdbKc/EzPo2oCKP+opvVYmGwGL03AJC0+lfFFgJ5/ZJ1bNCmzTbeEsZ7EgnK4AJwRAgCk4w
	sLOADRbImwL0BOL6x2Fkns3lo37VTd2LmfzG01/WvseXT7vy4Z8Eg2ZIdFOGAl6nYMnjRAFRR6a
	itMYigmOeDa3FpIWJSpIbc73/f44PX7U5O41pNzw8=
X-Gm-Gg: AR+sD13wtSvkoXixbLv6NmDv8+MGOrMzpy5+EW6RbmCbiaS3KiLDj/FJaPCIlIobKjP
	snFfkpZC9MQNb2lkdHwFuOzXftbjEYs8toBYMYYDzpERMOZdOicpx/lZDkNriid9/4+IZa9qu47
	Qrmc8zwnpVc1a8lwJMgKpXgZGWf13wdbAfMHkhLy8GrxK0izIApfjPktXihEo=
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id 00721157ae682-84c97c883fcmr68343977b3.14.1787560329134;
        Mon, 24 Aug 2026 01:32:09 -0700 (PDT)
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id
 00721157ae682-84c97c883fcmr68343627b3.14.1787560328615; Mon, 24 Aug 2026
 01:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com> <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
In-Reply-To: <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:01:56 +0530
X-Gm-Features: AcwNN1WlNs-6qzytO98tphr2YXd4fChtRhjYjtP6PBN0OwEa-gIZgJvnzverDeU
Message-ID: <CAC-tS8BRZk2EM_mP0aTMqv1uCdZ3haVbyhDZwTZR8abhA-SJRQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfXzNpDWgcDKgub
 sLcXzNNMDkpfOJGvVkdez5Lz2kNT/q7JGrI9Y8Uf38UrZDtXr5PFvAkQm4CCAoGAaoVUiAS66xv
 FiLSSCvCxjHTLE2ssSEHPv9bs/SqtO8eMcCz6dwcPrbjm8YbsEWkYQyuiXHBY+sUw2uO8StyXDR
 eycIsX1BDx1La9EhhC76V9rcw5V5elYr9ofrlVgAUEaVmk0lJOLUGC2PGKV7tdWABuol3mlBRBo
 GTrwTGSfS7GfgNyWSmTKzhL6pL+53IwWCd8T2vXJAn7HRyBmi7B2+P0rCGgU8/Qdod5tWMuitgo
 smXKy9JlRi/x9LWdatrneHVOLWik2ne1BXB6aS9PUbp9+jFUdCZhKfHuAgE6l3TuUDYnkMJ5Dq+
 v0XDrZlnV75b/+f5LyeewSZxlxGXKLaGP2DGYF39Fk64LfDoqCnb48hLS+tNtrb0cofwZmSDNMc
 feSNcOsl8hX24FHQ/zQ==
X-Proofpoint-GUID: jWUXKopkRAwwQKHWSDnTOzhgat3jpOcM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfXwVvtbuuCJPh+
 Brk5fL1od9ctIcTOZXUbkevNcRG57eFkWKotQbxYqc1PWYm2hL8OKNnG3EjXcFzK0xZSy9/ANqt
 ssolQH3zDooJ59y5xOD2TINJ653HBU4=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c0189 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=bgQE8YJmYTX2oDi9gDgA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: jWUXKopkRAwwQKHWSDnTOzhgat3jpOcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240074

On Mon, Aug 24, 2026 at 1:52=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-08-24 12:06:27, Harendra Gautam wrote:
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>
> Commit message missing.

Looks like due to spacing, commit text was ignored. Will add in next
patch. below is the content of commit text
"Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.=
"
-Harendra
