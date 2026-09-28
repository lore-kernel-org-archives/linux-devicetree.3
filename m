Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2E486E7D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586703; cv=pass; b=NikVTuSfq0jTmebhgoho12z4IGB2EsJGgubgnTIDNW5jRev9YHJ2UFKlsBqvC8LjRYEVDrBEFC3aagXgJy7O11SC4AXreDt0HG5dFzM1cAyBvjv+SDSNUSQuduBeW2addcoLXniUAKBKq87+WCTZB32mQevc3w6VGc6s9nE/eBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586703; c=relaxed/simple;
	bh=KTENyYqQEJ1QJsUU6WyAiz6HgJhYCr6u0cGxg5uGf9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWN9pspsMritEY0HRlIYWdzHKDbxAxfmHRj1s8RYFhYH7qOAemshWVoqaB/nB/fUfOXsocgZc2Wz1dbodLIccco7uTH6Kmtr2qKiwNYgV265R+dOQWgZzoxJBL6keE+uhds5zJLXbRpsTGB8r+p0E2C7ik3SpiWZi3bAC60jPes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocW9bnWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nixc8U/q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocW9bnWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nixc8U/q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S988G3923515
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=; b=ocW9bnWCtyfDOLpW
	24RrfcaBN2VSok9itSj+FdB/z1HwJYlh8mkkpzn+5p7KHR4dhU/3lspZwD4ofGpd
	bS4OkzdKl8YeJClO77+s2S1jlyVlR5kAVdWG1PRTHTtl8mrX+m35hjUXuJ6lfikd
	D7h9j6hbSunh8SQhdC708muRSNWCy9HHbQGAPqvh4owe3D7BzSPzlD7DMOqoM4gW
	8lDOlS+jWYU0O2672SLTPLUUNLfFXGG7F0BxDyo2Dfd/lKAIFyqWS8iEJhYHhP6e
	P5BuJBGbMApRNMWIo2dmVhlMHr/dPQNgYMFXZ/DGSje+3M/bahkWKArFZPwfqFkQ
	roBfNw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc00gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:11:40 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a7d69f4204so37541687b3.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586700; cv=none;
        d=google.com; s=arc-20260327;
        b=EiPu0FZtUjz5NiWVSyKVcNw+BVLY6OICmHjLx6WxyfId4YEdoOW7hsXOfPaWuHbuek
         tBeh40+QesxC0l1XI9X+S0iLLb/TNdsrlx3n0tf/sArU+C/2cHSr+/bqgcBtFkiWzgQK
         1PDmuSO19Wq8KOCPxv4sZkAAjJXAh6bPtp96KwoFE2R4yw10I1ZZ/jt6a1QnpR2F2E7J
         L3ocTrc1BCSfbE6ED0b7u6RKahCLGwV0Uup7fTVHVzUDDN0+et5eSJoEsYP5THi14d9e
         Xpa/ZHfIJvfJcme919P4wKUaJO2LuucA/nGn76QLJPcvHnX65LPcc1JiCG2NrbGmw3Rv
         +9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        fh=3ywcIQnQQfiMUAvMmyRIQAwElH4CiCC21qFdr1TekkM=;
        b=WF89O9bvONBHd5JYd17zhBVZLazvVFuVpWLzgOO8NqxuavApNfqjH7YrSFzGm/Q65j
         It0/vuYcxXADSENhabnuOl0FChMuLFY7i2u0stVmzdN2r+/+ia/qfr/iyu4Q9xPtEKdv
         ExC5mhCU7laYedJ1bmblqJEpeP0lE6pfncqs/DwcdiRZUQKz2O1JQczZ1vcdWLAOoaaO
         meQDgXZIpSWBHHedMFSO9toi8dQOlh3xHepV3Hvj5LDugycmj0FPO3fXPt6fCOlhgzD3
         aO8rWMjIOW+mu1nWOBfEt4jAY9LDnwGtgj72Zpbd0U++UHQJtCWRGmU6H2ojQWXQtyKL
         a2Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586700; x=1791191500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=Nixc8U/qhB6n9qnty0EC6TNCzgc5b/Ls5dE82vee1i53LODYVX5+y4m0kq3p5Jr25c
         vYrJA6KLbcyLMB5RzjenpJiZNQ/p/3r3JFPmYur3U2LgicVdBTYrz+Buh9V9EUNGAb0e
         IuNGtU0DCaY+fSd48c3rWkJYQKFbZE9qSBoMEf6T/3QdUpzA2Yaptb+9XPYRJSWY2Lz6
         OWCoIaW601wzbor2krIBiRu9wy4Ipt5F9/cqtf9IUr4XeA4zeH4W8JthUXrj/mlz793x
         v5lum27xsDNCEugUmXhI+VZlvQC4CFJYhqip/4hI41LDA1ebt0bM8013r+pc8tyTvStW
         HTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586700; x=1791191500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=V9+c3EbehLlCGAbon4W5HXbXjGvvfFQp2B3JevRRl1D4TknPSDnzUu6GQeTRcYdVOX
         gkFq2PXR+tviprAZVMPKkCFjmLYscw3hnvmadeSlf0whs8NuXCxJjajL/hjbWXbk1azh
         NXa1EWF1BQU5WuC+I5A2D+jiS7euD3bzP3HGUiWPObNJfGTiVDg/u7G3i6m5dz6U/ja9
         K9YxvYOzE35fhoDmyFEVvQVLTZJEx3oQ1RKJKk6PnWZAe80Oz/eK2OeJluTMP4S6+PDt
         LiU5m4nP0f7+aNBuLuDDOvOI137GRi1tMYsh6YpQWnqFQpkL+NisKuAmS6L4+hFi3IGq
         gbAA==
X-Forwarded-Encrypted: i=1; AKwUvBwBA+6CSFacssqDD4JtOwVehsDXu9KK0Pi616p4H8FUyV7GSfAoQyvd9L9x7PEPLeWM/qiyebDCUHk7@vger.kernel.org
X-Gm-Message-State: AFq9FYKeLpBRKpURLuagaHTA2Ferq1JzKcC7qr4dtAU2Sa31lH5HEIM5
	9a+4o5Zq+SrHvG6XIXSF6YXYjFS3jB8z2Iz6f+1UJoUUJGEMh80g9LwOq4m6NfRJVlgcUMIq5ze
	PGgdDjCVq1bnLYScON6pUxgI3y8uJ66Lq57dSu8aeiZaNMgzb1LjUjzhcn4S7sds/ITak0uP2Uu
	zUqGFEE2VhhRwdEzGlSOADBYXIuRQrUQrhctUe108=
X-Gm-Gg: AYBFou00qXajxtCXL/CQQLF3WOrKXggIc42FnArn3tqFj9vBFFbYucVXhYu2ZY43If9
	9aVsXXqVnp9i4tKUVaGgnLDUkvcnO0PIdsH5Z1XAV943oLDFUy97M4fM0Ofg13LCjH65tu/nCJ+
	I/mixDbiZ9FXvc3JFG52k8mpJToYLBtzGw4uPVMETxLQAvNC7kkqyybzx0L4E=
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id 00721157ae682-8a64b527551mr64705587b3.17.1790586700402;
        Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id
 00721157ae682-8a64b527551mr64705327b3.17.1790586699978; Mon, 28 Sep 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com> <arOcDLy_ESS6Qwcs@sirena.co.uk>
In-Reply-To: <arOcDLy_ESS6Qwcs@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:41:28 +0530
X-Gm-Features: AclHuK9E6ayaYE_Y95ZKtkfHPWfcu5v3kwH1jhnosx1aL68qwy7Agii-WL47rOs
Message-ID: <CAC-tS8AbBcN98ceaLFJaAt_+d6T0C5dpSSkRz_9yJv64KhE3kQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba2f4c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=_qd6ERi7e6bvJ_0A4_YA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: Wh4LQ--zuLl8pdPvgequfAY_G0n9JV8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXz6gB0VByjGiG
 wdhGDWqOCcqXNngtOEeFdw6+o+cZLOfCzHrJOvYNwziZUJOvOT+oSUe1TGXd8M1BqOeZcWe+l0v
 S/UJvYSE1u7IV5tjX9yF+SjEXZDCNv5SKDJz7VhjDu4hUJnK2hS2HFQLe2BcMLHVnrfRiR3CtI1
 OSIQJFmCcyWRudZ2ybEPkmC6bTDKxvlreO3ze5EknFyvhIAzxFAnO73AA2h4cMpQ1IkmWCrF9OX
 mOSQ2oY0vA6DkkJo7Q/HPH9i0+ZrG9pmWtxQg1nkOGW77VMot0FJssP159RN5hHrIFS30ZW7Q0q
 2/qIiZKqHarmZ5dxbaM+N0E50xFY/swJKT+GIEs7XJ8TO9GqMk+t2NgUBvAw0/hUVuR+s9FyUzz
 cHsZyS6meHMIyi4DYMivWyAZZHLlnZNVdlSjLSaaXDqTKWoYwj9BnKF/db0PoN8r5en34yupeCP
 OwdIwB0NJLJ0pm6cyOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXyCd1Ql3UoR6a
 iW5HzUM8rdttVPRkvl+UfsjrkuwJIRSJdFDOZWUl4X73kAQ8+cl4Bl7eCcuNKOu4+SjkmTFT8Iy
 RSKF+zQRuw0fMDMxFiO/6Xi29hSNHws=
X-Proofpoint-ORIG-GUID: Wh4LQ--zuLl8pdPvgequfAY_G0n9JV8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

On Wed, Sep 23, 2026 at 3:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:22PM +0530, Harendra Gautam wrote:
> > Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PC=
M
> > platform drivers.
>
> > +struct qaif_variant {
> > +     u32 rd_len;
> > +     u32 wr_len;
>
> Does anything use these?
Thanks for pointing it out, these dead fields were overlooked. Will
drop both in the next version.
-Harendra
