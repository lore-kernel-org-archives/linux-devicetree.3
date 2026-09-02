Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7142047A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342165; cv=pass; b=B+jeh2rKx9JcO1WphRWKyTums9LgaEFUSxnHQksnYTpJyePoy8KvRgu0HKOYv5CPiJWces27/Qx1q55NdM1Y5M/QtFnnVgKlVi0usiMxHrF+IU2knpw4Zfw/MT/flCQJfktHFlfRyYc5WY9rHctd7Ngo+WA29fUj9HT2itrfaZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342165; c=relaxed/simple;
	bh=aWe+No8ZS19hz230sh2JorbsRWoGkguobu79Z1ROYkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9db9r0S1ww0Bluc0Okqm8apkXkpkP+3PIDYrHhCiD4touPF2ZSW6/fNUT5jqdCwYtBfQVU/0rbRAXnXVtp/Ol8diV+YQ17qK86cjOGoG5MH/0kAr/ze6oh55j48U0E6kBof4ijtJgGtCGD1sVieIEjGSs1/2Dd4XEKvTgPVDRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEL+W6so; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iej2BrSP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEL+W6so";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iej2BrSP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MwTk1590040
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 09:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=; b=VEL+W6soir8eJes1
	BA69BHOtVllqXafA8ynp5/KFX/T7Gl3xJhtBesDN81kWMiizTe3IuDjE7mlvKU0K
	tWoH2QbZsGPyZmufhtS2WyrZqkGEp0kG0Ltfs9BPyOQvF32ukpmm6sD2SL1hCgjn
	WxckySLu1VMFbvmXXpCFdIbyAoblaC5CQg4UYvVaBVphVBJoZWNMVb3P3rAwKKlv
	xsaCWQVi+PyjsLUXFUT71R/ZEGOma3Inoxgout/EA9uFAP9ThFoadCtTB9qzzwok
	NcrcctZDzrdznAwRW/mfNjnyYenz1jUXNtIvchEz4KvaEd4gos8boScikaiYclpP
	RJWO0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy04pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:42:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso865394a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342161; cv=none;
        d=google.com; s=arc-20260327;
        b=iMHVIWCi+gnCm3sCWU5oJKgndKBe4Z1tWCO/TnzludNXnnYuF+qIvHqlcF1OruDxEm
         e1GUU/IxXaK9fPsOSg3RIVBDCokQRyk+3kSvMlTBJwOfkpjRJUtMW9bowmqsGDoJZZPh
         PObMr995DVrccERKxbB5YKPn4bxnqFVWLC82vQdTDDa64xObBSpawJphpKP8PDb5zNer
         ltDP9vK25hKRJ96vCWLVPLhcDkxGFH0rf2q7NKu92haUpSLRkhmk30RDDiKeg1CNcL97
         5Ld0Z9ul0xT5/Idd5HB8mfv8KEUg/ca4qGKHJTPr46VNSX2YqVg0L/RrX2TIQd8mQ+AN
         4cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        fh=fcBpgi5661ZLUy1AlzlCyyvR4Sjbbq9ICcgs4fvIDQc=;
        b=Ksgi9rYNrhFEezA6TrQ0HNRx8QkG9+am/Rj1c/U2M12Lup4xsVEm3ao9b7QDLQt1M3
         rI/7cUX1hTSEKQ9juNIO1f9kMWjj7PwavwnK99Pg0wijoRQqlKZVvWpLMBmgILJ3TTvk
         07UK439FcweU90S1rXmH8sQ5fB8cMn3/PnHe5hFZykQRE8IKijr3FHhobYFdMM7+x1A8
         /cI74B9NFQweecRTSRcOjqfbWjJE8FMx9HqgMYeViKVorA0hcFE+Rl9MB90aFiCApUdn
         U9hyHvockmgbau7fnt2LCDXEjh5qYajXMsTxj8SDSDCqNtBtBmtWSYpRyVsOyURHrPzr
         wAwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788342161; x=1788946961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=iej2BrSPfzwdDczZYyfvqajQHFziNWg6vsepYlEEyTgoFTzuyz6M0ecyhq6OQg/7uu
         l0IRZeZ+h8U4IwVcG5yWWt9yc3cSsOstQaTOhuTGDkWMamiGeVc2EWzxUuM3W3DJBaal
         CH/+gZW6abrvbnhS5TGt7ILyFDuPbggJxzlw2LNRS7SW9Xbqm5FZZPzdBWGDMi0VJlp0
         P/yIHVBRKt1IJQvosIBs5CHl+uOZWGQW7+MtxyDrPzjGElRkLYhmvpz3uWCkEZIGgxUW
         HIEd3a1yb4MfO5b64/V18G183oK9+tg9H+FM/npecIrJygYA2KA+Y62aoEXTbj/kXDq4
         otqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342161; x=1788946961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=OTIdsWiYK5L71YkcQfE6yuFaZ/15WnVwQAHyX0m2yw4yfng5hjRcL+TxU+M8cSNe8c
         hJpHTf9DTFpZH+AA0ApnSzlLhr1C3ybIzxCVx5C8xcR5hHEzSZ3++cryCtILyIu4moR/
         4FMKkJjVCyWk5RWmicfju78iRCrcDfQBl5LFduiMiIQcSjZcdnhJvb9O5ywuYCkXPtIC
         NNpeEogF/m1f2xUIv94WuLZyljNgDitZMmBUaxsUTVZZNRe9O0e1sjIKJnLTjH3B1eos
         xn/Vw5zV2f7h5td+zYraRunMsTgUBSsGcCAu0g9YLO7f4FcCRJ2xOdwPWY6R5EPvbA6O
         8TQg==
X-Forwarded-Encrypted: i=1; AHgh+RpVOfiInb7+FR5H8H8iyOCqM4tNaorP4rUYILaEq76ENI3CedDDyIU+v6AoiM0EDG66gQOPZmP0Y0ba@vger.kernel.org
X-Gm-Message-State: AFuF++mgxhB6Dn4i+b8P9O6hnA/724wdavIizMR4lXciRx8YW3gGB/vN
	/38lMXDBBm3ni0F/j4tPm5BcGyJJjsWeN/5U35O//VhXswerz/xIjPM36yLhLzkXgb7ym8ceY6W
	2uAGb4eRPPZG++ILba1EiAYX5l2bHwp5NvcLzNncmV9lWDvx1oCBqGb4D1+JVkpZ5JHIrNpi1VE
	L0eNvG7v1k25Gv608Wuv7/VxTQKTRtunr9t67qB64=
X-Gm-Gg: AR+sD10S3PWs22uW3/VFGCm2UuIzER+aIVruTFrYwZ9gf1hy7YFjYBYAnKC5qvhBSQz
	1t7A0cUi8A4zHotlwETxbpuejk3xqxdQt2z1hIuRMqs9hWKHPi3yTWe3KMEIoDIGGR6OG9jydet
	T0XqlDpmmgje+0MjPqZdmWNe646r+/C//bZJcr0l0KWzH5DwrFiJqVD/HiKQ==
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3d9ad268503mr5043435637.2.1788342161569;
        Wed, 02 Sep 2026 02:42:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id
 adf61e73a8af0-3d9ad268503mr5043383637.2.1788342161086; Wed, 02 Sep 2026
 02:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com> <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
In-Reply-To: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:42:29 +0200
X-Gm-Features: AcwNN1WALDMALJ5RAAfaqSF_k5ijpG9fT0E4A-HNX6PvS4KOXseUtPzRxqcGeEM
Message-ID: <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a97ef92 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VllaWavPb-a1161Ruz0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: cwjzJ-me477Lc3HgbxJKIS0Q4GNjXE3N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfXy5MioqgtUyfe
 jzKbIzzrwrgmM9uKlTk18PTvB6dOjcX6YxPeOHrhInWQ6Lp/2EaWbG1M/EZuj21xwUUDE8mqykn
 H/2bFCuOe8+/EGcRxkm9Ljo6kB29IRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfXwdIA3JzcsCWf
 pmC3Wrs5LhQc7ioA2DbuBub/MigqQ9YK+YFVePJghrJs2Vd10InhqFCO5Hq5quIwB8iKEYCRlec
 TYHUBBVeKYwLfvSkVudWqAa6UbiAHH9I04AnndkCI49Q5OLEEPrRxUZndTlO05A7sa/9SiXYjVq
 k8cmZp66ZiciYr0EQJgtV+oFzB4+1Cg4wHAvgIvQ4tgJH656eoJhnUk1MOGLntjXoAHRZ5lGPcP
 K98zT0bcpw8TMlKYi1tDrJdkY1qI4s9ohmLBWzF1CyKuVnOML4RLB8cXOQwied5nq+EHODweCI2
 QOEAzHI9biqWt5CB3WkQY0SA2/QNzDymK5cwa7XM+IZuKNzl2Z2LLi3Pgug5A+T1gObU0xdlO7V
 t2mdhdD9xFOBSkV2lFIshCGzgDJ0+i0gyM+znhllq1J7AxgGiDCnxp/NcO4Q4NEW0yu//NsL1AI
 /JyJwQhzCUC6DyXCpiw==
X-Proofpoint-ORIG-GUID: cwjzJ-me477Lc3HgbxJKIS0Q4GNjXE3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020085

On Wed, Sep 2, 2026 at 9:52=E2=80=AFAM Shawn Guo <shengchao.guo@oss.qualcom=
m.com> wrote:
>
> On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> > On Wed, Aug 26, 2026 at 3:55=E2=80=AFPM Shawn Guo
> > <shengchao.guo@oss.qualcomm.com> wrote:
> > >
> > > The Nord CDSP subsystems do not take their memory rail from the share=
d
> > > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > > power domain table.
> > >
> > > Changes for v2:
> > > - Drop remoteproc changes since "mx" of remoteproc is just the name o=
f
> > >   memory rail input which can be wired up to NMXC power domain in DT
> > > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-she=
ngchao.guo@oss.qualcomm.com/
> > >
> > > Anurag Pateriya (2):
> > >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> > >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> > >
> > >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> > >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> > >  2 files changed, 7 insertions(+)
> > >
> >
> > Applied for next, thanks!
>
> Thank you, Ulf!
>
> Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
> dependant DTS patches planned, so an immutable branch would help Bjorn
> to resolve the dependency.

I am always applying the updated dt bindings to an immutable branch
called dt. Allowing SoC maintainers to pull it in, for the purpose
that you just described.

Kind regards
Uffe
