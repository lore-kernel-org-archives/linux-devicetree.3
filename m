Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587682;
	b=xXkcL56Q+Hq5wC4wkPbdChkqSoWoPnpLXN0G1eJ6N4TbRzyF5gK1HOCgy3XCRTMjJaDQ
	 fDPUCEdvtQ9nc0IpJUqEQS01++S5tIPT/z0wRDJVXiEEbFbXLcQpPpWR254ttFglq/2Tg
	 M/HV0AR58hzC3GpMnic9A1Ht9bNEUEuVgnaM+Ur5ecjlHpCRgXqpd4XWHqI82j8ncPg8U
	 nndLLlbi6Y1yje+LYwgZUrVrtbBECL7OgP8sI3IbmY41ebbHnodmsrgX+rswVPtjGroRJ
	 fEXO785kefSmCd4YP3dzykCHyJF3Xx2AWTtvR2wm4czlDjiSWCxl131CXrqlkfPhKdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
	b=UVZ2Aq7Q7ojGZ6FGPQCEIHFQbr/3W9RfETJGoss8VGJ4DGUyzJE/z4JJJHWdB+w23GEI
	 aErz3JZJ3o1+qCN/mUAG44YHTaYPBK/V8o3t8QaQDxBXSJ6N/06YAdfzlB5DfLe7eQSLj
	 6XKbk4n0+FtB+4UKk68AS5BRbtvH3as9ZBmyfNsSaz6PcXZ5Q6+snQwDSe4JnznBSqXvh
	 PLWEDDTHuEHYFbKh+sLqI9HhxPJdfVEjXxIh9MGsi4SA1NCKKd31MzzUuv6vfaz5YAI0v
	 h3VA0SDX9NJ7u37zw7U/6IGeWS5VemC5syQ92MzSvLfP7Vc4AX/raGLWlsBcrbWw4Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtE8uGub;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L4CM/L1z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163B606A323
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8163B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtE8uGub;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L4CM/L1z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfuXD543795
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=; b=HtE8uGub3OuGwgUi
	LN4O1pHtrxZhZHfwkbZAYh56Waz3+wzJpEIkMSpjAu/Vbt6wT9CEqEm6Z/GyQ9HO
	zBd12tdyz3Nnm9ltd6Zf1TgU/xI/QTj7Tizc01Sbz2ZpyhbrYdnlKykwZdeQq1is
	7SfpCLhApJupbVSE7EHVAWEm10gcTxxWgw7EHUAbnZsfKuI8r/fTJJ2MGFX5hKtY
	ywj97sa03Oi2TeuPau2XLUbpJzFu9uUeGQRp/Kd3YolAPWIUU7KjE2iv9bBNcL+7
	IPtCe/vzjtcMSPh9OAX15PfKK8/3s5CNxmw5k1nI+qmQRGwkuuqWt++lHci6DBYD
	o9M96g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48sk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:01:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so143234785a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587674; cv=none;
        d=google.com; s=arc-20260327;
        b=r/hHJEwZrTcb3eFaIAr4Ee3l58msBxM/x9LhLpS35Jr5rNSmPf8Q9Fl1GtNpVr4yQB
         HKI1VsME4YZUXm/nMjqQO9e2nrHfyRvF4m1B8AuV2C/BopFhHRDy7NBSpln4h5SNrFh2
         WdhjVcY8QWpwwv9VjPGZ14QlI7EKNH1uJjeD2MzMo+1wo6otToxSsDoVFx4djg0/PbfX
         bJ0olBFNS4pVrsKpEnar2u7lhHzdFTA6Unt8bHvUvrzcZFdsubzMHFwVKYoyGUYk2Aqa
         D1gvCvBHj0xocQLLd1zhYOVs3QEaIGCJjVTxr5XHUFHRu9aHcOfmFUKC0zotuNfkXn1Q
         KFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        fh=mz259HwPayGfJ4G6RtIIsoBT59SBbuxeebfaF5N7NT8=;
        b=jebUWS4e+PxeIQ+9CTX1rHTHBY8hMKc2Ju6uk2EWjeCzw4FWQI5Ubd17R+5U03lFho
         A6yWn9ioOkWUAZVYKTG0Zho1yKYk9bqOpX1hnNO7ACFOfB6rniyBl1m0oN4gJUuJYbXx
         JzaR2yOvTVg1A3qP4bgjTbiFyyHooAi3rDMazbB4xX238V09vQrzWjeLdH7JlzgyUZeh
         c/SlNSXlL357cQfwV/X8TzYERzCnRNfDvpGK37hJi8FondWKUK07094yFJ1P1GmVGpvI
         s+7yTjaTC3ICF6l85oBD+JCmoyToY/dGfhRzxidRKScn+1/O5MNGRL1HtloCl1pSEjLG
         pVew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587674; x=1793192474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        b=L4CM/L1zAz46OZ3NjYpuK/b4yMm0nveY1UMkFJ22X8NPXIR6n+Nl87QBC/FLpNSG4G
         vVpZ7Ja4k/G1nO+Ni88YfrOA1DDWq2ydPq/BgEefNtrQfN/6jUwnFmB4Hxx52kT5Aode
         xLqMQhyKcstapPtYsFYCd6uS0At0uUKFrI3Uf9Dt8nwoE0EW6E5/6zqECo4uHLcVHNsC
         enNiUVtwCoLvtolhF83QhKpyl4p3/muwELVNu7kjOy1L/u7bNgG5vC4qEZrvD+tjFsiC
         WvXQl4K6XOw9qn50beQvIUOP/ZStTvlx9MWFKJX2UYkyM4papJQCocs/EzLhn1IeJ6wd
         x9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587674; x=1793192474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        b=t9PpAdzg3p5Rsn6HpXLAdvFUDiUmi1f+ZVpguoj44mG7udgdkS/yufah8zWNq5SK/W
         Xqy1zxJ8zZl3wAjFJ4FHwkUpSmW/RvRT/LHZtGUeaZwCzI9WkeGQ0UNAuxRJKkYQXQ0u
         t+1wnvdxa0LDgUTUqfiu17JQSfuZp25Fq4z5t+tCaS1Xc+lZOfOP01myy8zARfST3uqP
         x5Ihv4R7LnJO7cN4E0U57D+OBxkX/nbwIj1JnPr2j4mJUQqI1tiwDoGMyzlGOV7TdMa5
         dZhkLyiu+iLm8Vf6wm2CxUjDYYEvdnkWGCmzaJN/7ahZKMEu2NBF3t7LRVMVHV1UDL4C
         eoUw==
X-Forwarded-Encrypted: i=1; AKwUvBw0NJUPHb3hOushCxEQv0T9Nh6UiJNuQCMivqLwxGBZDZ9CzJXJTlFAwbyKItgFnY3P3YGDSZcj1DnQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIy63jUtllvz8VJW7+Md+Zetb9z3wR8kfKEK/W4gzoAkAsraKp2
	sUgtxY3T1LGGtEI0yFMeVsgJeZk5U7G6+F+AuVQaJndY3IBe2gnrvsl3GWix/RYtxW18grLdP3M
	6u2eNMOh+99dttFHUjCFvscuE97lpS/dHUe9oPXLmbnWkTfEh2WYxZa0gGxkOichpKPYA9KMkx/
	dMRqEh44cJWJAptiIrBNidZdvuFMkPK00oo0XvFbo=
X-Gm-Gg: AYBFou3GkuUt/9sW+rTjWHnLRKIKsFq8SEsH3azwsuM9wMT6dWN7bQNj2irHKK24NaK
	kjRbpgwj//HThGvyiHRTB5AoHIoqgdkFXVB3xeV3W5MEuiP8oQTCQf5MnbqSJtlqo6FjTxNvCn/
	OLDcEvzzzJ3ZWV8LeOmJsuKjMmlg6F907LHgc1DiCQoLkWsebwZGivCnWek/+e0q7qkMak0kE4g
	c61fMh+ENi4b7lHqItYC6NeaRyfiuZv4zT6h4lAesPwzynbxqUTwB5Qe2vx5sIx3aoFo0Sy2DU=
X-Received: by 2002:a05:620a:394a:b0:93f:34c9:9248 with SMTP id af79cd13be357-93f57f04eebmr415406485a.22.1792587670440;
        Wed, 21 Oct 2026 06:01:10 -0700 (PDT)
X-Received: by 2002:a05:620a:394a:b0:93f:34c9:9248 with SMTP id
 af79cd13be357-93f57f04eebmr415365085a.22.1792587666477; Wed, 21 Oct 2026
 06:01:06 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com> <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
 <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
In-Reply-To: <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:00:54 +0200
X-Gm-Features: AclHuK-8q0aX4k5XsAnz-t3dRuV7UwkayPffcJ2itPbwK18KPuujnhjZ4aFGTag
Message-ID: <CAFEp6-16PUJzLKZUBrC2g7oh8pN_Tygrf6wYX53nL+YM4ZvunQ@mail.gmail.com>
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Q1Td67i1kbv0PONC_cAC5OxJcmNWqGeJ
X-Proofpoint-GUID: Q1Td67i1kbv0PONC_cAC5OxJcmNWqGeJ
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8b79a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=DWtyPYmOaO5ShKUgkzEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX6RF3i9PCASFy
 R4p8hVGSVCKrVYBSSOVtBc/r1ixzQPxUhJcNcag5XQK6qAy4IzZ+0Fv5AKWHyQJ/WaovTvPYjQV
 ThRMBJd49xLGgtAzq+nkEru7AIJ70czoVbzQf6xJ+/WypEggKZpIHvBJQMwF4EZAY9diJ7SGaIK
 IfKP6c2E8DdfD5mnCi51tR97Vwrq0Zf7hZQ8tQjH2EkcnIMvxbkf+D3/ST/nDxBgLAUscVJYIQT
 9KKeOdsuQDDl/dMQj/i+k5kbo6YOf32ctgnXsgv0uliOBbLldTlcYm8VvdzRx2goOTM1gwNl5Pj
 CkSgJUSYc4CgU1rpwismQZkqEUchf4yA/xTmF7hPJ6nKWma8Yjiura9TQ2COhFFPmERgCLdTAY8
 cLNZ9/IqEWx/q3/GXkbbNnXtY+ac9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX5LfZlNob///B
 K5TjElRfIF8YePtf+RLnxQtsZIGzgcTCWCICr5v4cR4gIDj0QUXKTCJyqEGL4ya/fjVprbqfZGA
 Fa5K8dY3FAGSupi5JYXVV8fOKHM6ySw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610210051

On Wed, Oct 21, 2026 at 1:24=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 10/21/2026 4:53 PM, Bryan O'Donoghue wrote:
> > On 21/10/2026 08:37, Wenmeng Liu wrote:
> >>
> >> Hi Bryan, Hangxiang,
> >>
> >> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
> >>> On stream-on, CAMSS starts the subdevices upstream from the video nod=
e
> >>> through their sink pads, so the VFE is started before the CSID.
> >>>
> >>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> >>> rather than the VFE. However, vfe_enable_output_v2() still issues a
> >>> REG_UPDATE after queueing each initial buffer, before the CSID has
> >>> configured the stream. The VFE then never signals BUF_DONE. Therefore=
,
> >>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 6=
80
> >>> and CSID Gen3 instead. The operation happens after the RX configurati=
on
> >>> and before the RDI path is enabled.
> >>>
> >>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected t=
o
> >>> the VFE sink pad implements the reg_update callback. Platforms whose
> >>> CSID does not provide this callback, as well as lines fed by ISPIF,
> >>> keep the existing VFE-side REG_UPDATE.
> >>>
> >>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> >>> ---
> >>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
> >>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
> >>>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++
> >>> + +++++++++-
> >>>   3 files changed, 42 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/
> >>> drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> index 345a67c8fb94..556cdfef6207 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct
> >>> csid_device *csid, u8 enable, u8
> >>>       writel(val, csid->base + CSID_RDI_CFG0(port));
> >>>   }
> >>> +static void csid_subdev_reg_update(struct csid_device *csid, int
> >>> port_id, bool is_clear);
> >>> +
> >>>   static void csid_configure_stream(struct csid_device *csid, u8 enab=
le)
> >>>   {
> >>>       int i;
> >>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct
> >>> csid_device *csid, u8 enable)
> >>>           if (csid->phy.en_vc & BIT(i)) {
> >>>               __csid_configure_rdi_stream(csid, enable, i, 0);
> >>>               __csid_configure_rx(csid, &csid->phy, 0);
> >>> +            csid_subdev_reg_update(csid, i, false);
> >>>               __csid_ctrl_rdi(csid, enable, i);
> >>>           }
> >>>       }
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/
> >>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> index 0fdbf75fb27d..830c9c818d3d 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct
> >>> csid_device *csid, u8 enable, u8
> >>>       writel(val, csid->base + CSID_RDI_CFG0(port));
> >>>   }
> >>> +static void csid_subdev_reg_update(struct csid_device *csid, int
> >>> port_id, bool is_clear);
> >>> +
> >>>   static void csid_configure_stream(struct csid_device *csid, u8 enab=
le)
> >>>   {
> >>>       u8 i;
> >>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct
> >>> csid_device *csid, u8 enable)
> >>>           if (csid->phy.en_vc & BIT(i)) {
> >>>               __csid_configure_rdi_stream(csid, enable, i, 0);
> >>>               __csid_configure_rx(csid, &csid->phy, 0);
> >>> +            csid_subdev_reg_update(csid, i, false);
> >>>               __csid_ctrl_rdi(csid, enable, i);
> >>>           }
> >>>   }
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/
> >>> media/platform/qcom/camss/camss-vfe.c
> >>> index 2680a9914765..16a0b5663fe2 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm=
)
> >>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
> >>>   }
> >>> +/*
> >>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding
> >>> this line
> >>> + * issues its own streamon RUP (i.e. its configure_stream does the
> >>> RUP).
> >>> + *
> >>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs,
> >>> so the
> >>> + * upstream entity of the sink pad is either a CSID (possibly with
> >>> RUP) or an
> >>> + * ISPIF (no RUP). Only enabled links are considered.
> >>> + */
> >>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> >>> +{
> >>> +    struct vfe_device *vfe =3D to_vfe(line);
> >>> +    struct camss *camss =3D vfe->camss;
> >>> +    struct media_pad *remote;
> >>> +    unsigned int i;
> >>> +
> >>> +    remote =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SI=
NK]);
> >>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> >>> +        return false;
> >>> +
> >>> +    for (i =3D 0; i < camss->res->csid_num; i++) {
> >>> +        struct csid_device *csid =3D &camss->csid[i];
> >>> +
> >>> +        if (&csid->subdev.entity !=3D remote->entity)
> >>> +            continue;
> >>> +
> >>> +        return !!csid->res->hw_ops->reg_update;
> >>> +    }
> >>> +
> >>> +    return false;
> >>> +}
> >>> +
> >>>   int vfe_enable_output_v2(struct vfe_line *line)
> >>>   {
> >>>       struct vfe_device *vfe =3D to_vfe(line);
> >>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>       unsigned long flags;
> >>>       unsigned int frame_skip =3D 0;
> >>>       unsigned int i;
> >>> +    bool rup_in_csid;
> >>>       sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
> >>>       if (sensor_pad) {
> >>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>               frame_skip =3D VFE_FRAME_DROP_VAL - 1;
> >>>       }
> >>> +    rup_in_csid =3D vfe_upstream_csid_has_reg_update(line);
> >>> +
> >>>       spin_lock_irqsave(&vfe->output_lock, flags);
> >>>       ops->reg_update_clear(vfe, line->id);
> >>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>           output->gen2.active_num++;
> >>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
> >>>                      output->buf[i]->addr[0], line);
> >>> -        ops->reg_update(vfe, line->id);
> >>> +        if (!rup_in_csid)
> >>> +            ops->reg_update(vfe, line->id);
> >>>       }
> >>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
> >>>
> >>
> >> According to the hardware documentation:
> >> Starting with CSID 680, CAMIF has moved into the CSID. As a result,
> >> RUP is now issued by the CSID and propagated to the IFE.
> >>
> >> Starting with CSID 980, software must also set the SET bit in
> >> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware
> >> ignores the command and the corresponding register update does not
> >> take effect.
> >>
> >>
> >> Bryan, according to the HW documentation, the change itself is
> >> consistent with the required programming sequence. The main question
> >> is whether this is the right implementation from the driver
> >> perspective, or if there is a cleaner way to handle it.
> >>
> >> I have tested the change on the Hamoa EVK board.
> >> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
> >>
> >>
> >> Thanks,
> >> Wenmeng
> >
> > OK thank you for the explanation.
> >
> > OTOH I agree with Loic's statement - it is cleaner to subtract the
> > callback and disjunct on its presence than to add a flag to the same
> > effect in reverse.
> >
> > ---
> > bod
>
> Hi Loic, Bryan, thanks for the review. I wonder if it would be better to
> keep the check on the CSID side?
>
> vfe->reg_update() is also used outside stream-on, such as bufdone, queue
> buffer. It must be implemented in VFE. We only want to change the VFE
> behavior at stream-on stage, in function vfe_enable_output_v2(). So
> making vfe->reg_update() optional could affect runtime updates.

But the patch says:
'The REG_UPDATE is issued through the CSID rather than the VFE'

So you mean it's not always driven by CSID?

Also, today we perform a reg_update after queuing a buffer (i.e. after
programming ADDR). However, as far as I know, this is no longer
necessary in recent VFE/TFE/IFE generations. In those implementations,
the ADDR register is not double-buffered and is not part of the
reg-update set. Instead, it behaves as a FIFO entry, so issuing a
reg_update only results in a useless RUP_DONE interrupt.

>
> Maybe the cheapest way is still to check the CSID side reg_update
> implementation at stream-on stage? I'm very glad to hear your
> suggestions. Thanks a lot.
>
> ---
> Best Regards,
> Hangxiang
