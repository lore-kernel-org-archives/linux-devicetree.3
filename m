Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9313A4F35
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994657; cv=pass; b=lr6MnTM47iY4Hm6vGG/PGQ1pYBoLrAN5ZRc7JMlP8zSmHCN+Kgf+oGtcKP+Vcf18lrkK+wrT1TJO3pALB0zbBOlFymZKVMXexgCUAcoPsd9DquGEKG8HazvXdsfwNymtanLxqPxBWezEi7eFPvIJ0YFMIepJHQsV3e66Exi/760=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994657; c=relaxed/simple;
	bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEzn7FkjQ4Kf0ek8S9YptbZw2KDv/a0CVdPLtABj4sJ16K8RdXVPVOYPZVLuNUT0IKC6YtQVz1IjS4JbcopRVOS/VJuYkK2v9sex44PUcL1Ru+He5ckqmluyw+ibnnDkygP31SloL7/RbvR+bmoxRCOY4BHfrAC9NitPxXThnAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3O2LrFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9U+NMeF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3O2LrFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9U+NMeF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T80Z8C1921161
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9R0m/OtdoBNGH1Uc/ryAzaH
	BWvPsUBfW16dR7HZ5cc=; b=h3O2LrFRLjD+cR2dhW2tTnX8EG9JsdyMcU8Pzq5M
	RDn+8T6fA5lM+8fWIydv02iZ9pLjVIGqaYf5tiONU+ckgnqZKKl6A1LqeX3hcAKi
	daV5EA7nU5LEmirpW6rJmOzy34dHM4zDC2UkhPs861MXGodsn07PPse3IxUe42rh
	J2AujUuvquZJk2Hd+S+tJbDAeBoaIVnG6qjPWVeBrWTVKccJxewSmyMfd4mQO7IY
	CbJtbqJBrbK3YMQzYB9I6EwdFw1zIVDLqoSMP0NDWJFs44xBndqA1VxFsvIn4X8+
	zm+amfWEw2p/Lp5eC8aBLuooeAt+8kg7/LNT8kuk+xcKQA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfgmhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:10:55 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-858b746a9a8so51189727b3.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787994654; cv=none;
        d=google.com; s=arc-20260327;
        b=RoNj472Utd8pC7bfO/2a8WeGr8Jmd6kx0fF9aWEMugj4gIVaHUZHPDDrrPBHmcWnxH
         6NkigasgpbyC8F64XIxGNDRIYwexPhG+QeoybO2K2NqIL1HrnJbnoxR395aRXbMx1Rnd
         psNU708iBcW+vpXA+4AUOrrEUaR9HrUr6aClX0wKP4/df3RwpOXiwwFbCOK/xNn70Nac
         B3hYeG2vMspaW9V53CVJSzgV89RYlPBNbAT7kXkSxGLrHthFYgxQinUAK0Y6jXL6e7tC
         1ff0mHfMOa4PL+P2LzAcRv1oxU9Skel0esaH60gFACxpwtpmSyLbxInHiVLG/fWrMb8x
         4Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        fh=Z2FnIKToubC1yI8WzUIR3r3JdfO3BCR6yOJ7YGFGXAw=;
        b=NUKuBtWHrnzvRNI9UU7vMO5i6u+2uPXbcbQ88AgdiwO2lgiEu61zd0NNmBRDMgIhn7
         eC5hJBsV8c95b38bSLS9Mbq8AKn4Gs15gppuDvaZU6wcrU7bZDtw9kSxlphHInV4IhSA
         svYA2CN9bjUZRf0SC4lP4OJ4eVqp61nKYu82NC9SpjIjoGECB2SwMK1PKmMR6IW/ChKL
         Silm+ikAuGPvAdEEXYMX5uuiqxlGBsbIQoQFqQKQWuSXT8gq87fcrzCmEEdTQQvB2hRu
         blGzG9AaPv/rr646qORzIW/Yu+RE0g5YcACWfH6W4qUQzfV5GQSUZ2jeu+7GqA9UON6H
         iNZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787994654; x=1788599454; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=T9U+NMeF+rO+RFzQYanpehBdRCn+962YGfSAFGvyXuczUr5cci2Eqzoh8BYGDPuera
         bmHmnk4fjPdT0coiJxsLRtKuH+QybBNKZzIWKgEOuVGSBD1O9uwrp4EW1E50fmGeZs3Y
         DEwY1KsXwbyd/9el9TCEjsLYdf2Gi+cQp3XjI04eV1J/gVd2nhtpRUvzzVmJy1MIZmfl
         4apVUMYkcs4LRt85U024gBuM0frlPNpSf6IUZfK3s2jpbtfwr9fXP5fWOyJ8I9/Q6SKG
         WlJNL1ntfDSAl9v95lbG1aMN8HQpTNAv40eZqveTAy09dxoSKrbyy579ZpotKaXEmPQC
         vx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787994654; x=1788599454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=Nwa7+5cs905QsBCwZThWuzpQH7Ak7Ewa6CiIurODdPlu7y5e8KIPpjdpyU8y2cHPbq
         Q1+ZVYd7pXZhLR53JMydxAlhgGY6uHr7LcpuUIBuQIA632e3VhVZqxWVIhQw1OC5AD/5
         MPW1OhfRfL7en+awOJBIFgANVkP4KnTROYlTA7Rp3SSNEm+VADdE6jrny6c/cd+OtMBk
         9a+Y+UGwLF015nScUWBVxiXdSayUHz4allk9nB/TIxFlLznwPawm+o1leXK3RYZQ7FtS
         LvInDb5TxYc2YBf0WesG3DOfhJOYuji6j/2huzGsIY/0yBuvXvkoBsrz2OsI2o7wChss
         hQxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGx29WT2O+p9X9PFjRmBN97i65LSNVv8BvJq7tjpfm/W25cmF0tO/on1t5mpK0wH1yQEMjcnwFm3kc@vger.kernel.org
X-Gm-Message-State: AFuF++n2Oja6S2lunzoSYMZTAXfhnvMc1t2muzr88PIi7B+9IBWzhC6S
	9+UjT1Wgs/t+Hi4GJqiX+2/jBmlRkhFMdJMS7/olxWKO+Wyh3LWqiBCa7jUaoH8x7mDwPaKwb5B
	Nz1pX/q58SGBnWzWZ+vPCaG/A5cPjkU6Xc1asQa0A5OiZM2EjkxYClKzrgcKq+SfSpbu36Xzc6V
	GdDl0ow/Md15DF1+MxyCacSaZje4tK2a2hanwsK7M=
X-Gm-Gg: AYBFou0LZ1nHLb8BvUdqqsHAkgZgXmZqFc4KtxD0f/phcoApjIE76fWzHrr1S7n7EC+
	6TSFG0etQ7Qx66EEtwheeaSaNHiiNfjPH7F3mp6u5J84WDnIzmT/A9NPvnaXESXvCJ8SPs3yyof
	GcyWZkPjhDdVP9/LqwphGqyZHjd8nqcVco9R+fTpHyW2/ekP47DifyEsdjFA==
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id 956f58d0204a3-66e4c43b71bmr3308233d50.13.1787994654551;
        Sat, 29 Aug 2026 02:10:54 -0700 (PDT)
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id
 956f58d0204a3-66e4c43b71bmr3308134d50.13.1787994647938; Sat, 29 Aug 2026
 02:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
In-Reply-To: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 14:40:36 +0530
X-Gm-Features: AcwNN1WZTqtwCy398rg4Jah6gCzauP506o5iczp3wsP_In2soqp-bDWVzQ4xo1g
Message-ID: <CAC-tS8BjRPjcFYMjuvyB-9uJkYB=rNkTUtDq9jF6EzgjKfb_qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfX6Zp0l2Q49QuJ
 OmyNv8RYjUAKEU5WhZVAuOZmKNSq+aIPpZq5kTNjfVXAWXnsi57oTBQ87Qs7v0jI1EWraVqYl/1
 hOcoqMctjNIIkWM1tNx/K0LbeE2YZ6U5waHqy/cuLv49/EGUTbHKQW7HQ2IFJlYPWQuOhGPni9M
 UnOyu124MM3Ib4JnSpovLPqfxTwVh7+EzZuYF0jtCZXgTim9V1fcqFVebx2MmjDM9MFl/ZHdrhc
 WPECSjf9R2t10oU/QfXtUeAFZU3eqUy6PB+/8kpwsWg6OwSRDKEK3AHvJRW80+ns5/0TN0oQ36n
 05Z7ksppbFbE3KSN/fciFnb8qDLN+N92eHES8cOHexi6Rda0mdbvR7aI2gFu8GFh+xUlqhgyWnI
 9/m10xsArm8ZMhF8gAAAW7CXxnjHKCL8RwS4mFYtilPqY+EbE4XOUk/gLUEnmPQAmrJgF07Bl9N
 4zGIB8aWCqnVDpmkf+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfXzjcl+/uGED8O
 nR0GOOBGJEsw165kKI3C8vRFCVaNSYgWc8upM6/z9sJWaC3h7abBI+3WAynjG52qjdIjYVcI6T/
 7dPRAA/2iDljdGaFk6KV69zoxoJhFCE=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a92a21f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=SUKUb0CtNzGe3DbvoegA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: LfTK6ih_pkdreHatPuqB5Cy99OsZYmHi
X-Proofpoint-ORIG-GUID: LfTK6ih_pkdreHatPuqB5Cy99OsZYmHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290078

> >> Srini, could you please confirm if adding QAIF DAIs to
> >> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> >> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> >> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> >
> > BTW, the dai ids are already added by Prasad
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> >
> >
> > You should use them.
>
> Correction, he only added QAIF clk ids, not the dai ids, Not sure why
> dai ids are missing.
>
> That also raises question on how did Prasad test it without the QAIF dai
> ids.
These IDs appear to have been introduced for QAIF interface clock
support in PRM SPF for DSP solution. Starting with HAWI, QAIF has been
in use.
>
>
> --srini
> >
> > to your question about increase in size, yes, this is know issue, i have
> > some changes to send which will remove the need of this static array
> > which should fix the concerns.
> >
> > But for now all the hardware dai ids for qualcomm SoCs should be in a
> > single place irrespective of dsp or non dsp solution.
> >
Understood. I will add QAIF DAI IDs in qcom,q6dsp-lpass-ports.h in the
next version.
-Harendra
