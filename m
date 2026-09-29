Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0214FDE48
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676212; cv=pass; b=lh+/n/SxxSjZlcP+Snznljbtt4e8XqXQVjQ6JjSTiSu3syguzg5svygFIGVvWqG2L3JZIdGR1NUewKVhZeoZVN5/1MUxTHutg/U++cP0MHHgbiYqCyD+NT2DN9NG90bdITKXy5yglBJUoB5dBUArbQ+xJhjV9iC2tN5skK5M9bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676212; c=relaxed/simple;
	bh=428tXCbvtfrk+2zlh0uwJkqz4i0sMFragXvVb9rwGLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyaYX9XFnDZ2Q0GzA9orPKZPntZUQwgGRQXI4L/eABjRhbQAjkOAg7vNjrVum0/wBMwf7FVZZvNxEHm+T6H2l+TCEU/iCoFB+jgtG0BA+no+QkvjnbVj7i3DZe7ejI6g6UxYIyMtQytijb9zd1GLH34wOG1ezsvgCvfbyd07CHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRRIX5+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXIQ3xzp; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRRIX5+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXIQ3xzp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TxCI4087139
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=; b=WRRIX5+wX7JM4mWz
	/tShCvtr9UJWqMeykDUccHF6LMsQpbqWmaVY12gZj/uEzZtP2j0opy2dRARb7xGA
	Fo0ktIRt7YSHn/D6MjrZon8SnLkUJ/AstmOal1R+1+OeTNTCCi39evHFEkl9CbK2
	4RdnU9cMBMhmjqNzUbe6n+yIpNLNhSJI3W0kRAxxbRH+iz2r6nI3Dcv0g0yodmZl
	inAmX/2fOHsCv27Y6V99QtXHabEaF3WKabjsWsDpn9N8OwfTOjudVGJkjsTN3uU5
	uiRikW+Z07x6qwiRk7WFxz9pCZujAdfqgjMWkvpwaWloN5YdoVVAIT6cR/1rVYyO
	uFXdBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4tefk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:03:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a183a0e93so872600685a.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676205; cv=none;
        d=google.com; s=arc-20260327;
        b=atw6l9+KLm1OxBg4ktzCRp6PEAGhDp5DXtz9rQHI2pdoKlAlIO8hP8jFrCQSAwe0Sz
         XcehS8mYA21XWM9RlnaN4GUC/zUfX8qojAmA95RANVqtvrG4utEYb63JV0FPLdBpZ6/k
         BKpoxDh3RZlZB7tR5oK9grtpMBF7eQNoZcp9ooz46FELTPNPBv5yEfaoG4P83Yyc2DOD
         J4b0Z8JhscewznLo7FC+zwFUrLOwT+NDw8EO9BpdTKOo69YKHgs6/Te8ArI9GI542Xi5
         MJcJdn9Sn+UUAwErCn67B47y+JZUwAhnAf53juS1M8AuNRvdX3SIHFzVwR9k7AR8QKMl
         E9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        fh=EGvfupmo0oSTdfduaU2E/W4DrZJgKqwnLjTVbg3RBP4=;
        b=Cln/XvAArrPwWlrF7K6gZKaxzRrPk1gNu7p/WzcvECSAimGjye7rjNW9uJ+rM5wum8
         NTnfOigeMp2QPl5pgnRx/gwlU+0phN/ZcHxklj8P2KTUvatP/lxRjZsvOL85R8enErXE
         lcamqRdfHV96XJsTZ3sOfObkBfdagFXEnPlsvrfGFt9Rx2n3y5fNUDVpO5H6VDEEOSXR
         dfQ8I50WC4dgALVc2PVCmeJmT5M0LSH/HYz9krNsEDg9X+edAqgEzmh27JFuPm/9FLBv
         UwmGX7ItZ/hoNxvRIcvugAB4s5XAmXoHQM7v7PSrmw9ciQxCqsZxrrDMXbeiip0vwkYq
         0lBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676205; x=1791281005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=XXIQ3xzpCLCifScGQY/i4EzKS9Xo0Ff9FyJuZohg0ayu/OjBmSjYA5G4VfM+l73Mkp
         Ufs+X/5p5Y59t711G29B/dnfCa5CFuSJekUtgvaMlZNUQG6LCwwe6V8UUR6gmYY5shaN
         m2TaEX7AR60fi0MbAcNkmuy3VBg+FEbwNKgVJO70MgsoODXYaVG6WjRqS7TpOMAEjYO4
         vkxvxEQjpmcYY53Wht+Kwn8VtdIGofQHLQwN4SlilvazUIKRSFZxU42Rzt9DlcgyvMFv
         gsenduSDHM6m9l2tuv46S6gww+8DWSkLVHx/qluFpsi0ERL+V+VYtquA0R0iAnCFM3Fy
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676205; x=1791281005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=druxFpYOP1sXrhCic5oEiXhMSRJVQSaCme6TJHbYKNv8r8djj4ggSR1ohy5Ulfb5T/
         8mBh4Y7LEdUWMY65Dru0KHCTbi8QIkJeSwtu81WuLqTP4NBx2tALqwx3swghoRtAVuPI
         iyxWWu/WiEUUvqOvnmBaZGbqkDKXw9Zq9iGeZvMDQic5b6FButXeXY20/QxCfksil+1G
         TotzFXlkw/y3YBUr9yr29inrYVQ3FaMiVKkrs5GC2us5WLTv7bfhNCxm0wv7q44gytKU
         aKwfGQqif0cp9x7Yztel+r1OkGzM0+X7cFOr3B5Qj2Ytt80xEYTytw+T2IJkZzOam4v+
         2y+Q==
X-Forwarded-Encrypted: i=1; AKwUvBziBUG9yZUOYcMG7oWL1FBGNBAkgPEQoeYL98ps+7LyxV/XPTtlu5Be1gORFScojTJj4TRNrDfLlhIb@vger.kernel.org
X-Gm-Message-State: AFuF++lnUvu0yyxJzezHuwwluO9x1PmV15dW8yziOYFC2BuOJ3xq2v3+
	iuKh84C8W5WrMJXbJekkH/Z0/ZiPzMeaGtaHmWNAp+PBgEHieW4I2TUOKFsUmWp00Uq0swk/opg
	dSlip9Fh3K2/WFoRTP2VYzDS3O4Yddzz8EWrKMyVpjS9b4EXOUZ8ubK3dr+7ThMZEyqL8jGHLmB
	CShLkHbIZmjPuG43AuaO963DiwJz4dW488HQEJ1xc=
X-Gm-Gg: AYBFou02iDTuWFPX/kyGxOgQE+JHVYzjLwCs4YpMquaxbzbqm56fVaxfqdF99xiuQ4L
	VT4yFLX0GqKTMecvvwbHEEnXHXaibcHyEw+hOZRdTTvQSh/rC95Haa4Kc6MqB21Cnt8iODrky+e
	G3Ig8QudHz+GPsEj3mx4MY186ryqdkUY70fvPjt0rt9VnQ82K9pzyYy+y+P7AFVbiMDoHNQvD4M
	Wkm/eegGgkzHxtHBBLIBsWxjOp5jZQfkAR6LTvzFkS9r/QALECIbd+3Oyvef/i0tgylZQljUvhL
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c43cd61a7mr2588126285a.42.1790676204609;
        Tue, 29 Sep 2026 03:03:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id
 af79cd13be357-93c43cd61a7mr2588119585a.42.1790676204086; Tue, 29 Sep 2026
 03:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com> <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:03:13 +0200
X-Gm-Features: AclHuK8hrus5ifIhd0kBrHEFVRgKNmcLi6GGy2VwQ0rTLUBWrWRbn9i9ZtKBjZc
Message-ID: <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX7g1tnBM0jPDV
 XQbgKw0QrSPgo7udN8M68/5Fi+tTp5HjAEHYA4o8CbAu0Z2dTe2vUCnJ7bWGsxuFdUodh3Phi4F
 zP2lrKHGk7ZfrHxUHcWLKSmtMMzNsHw=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb8ced cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=k-oZKQUuCPdrsXQy0KMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX68HX5fitemnH
 6Vqdm0wOqU7n6m1rjU6g8efxM8If/hpBJwDzqMIHCUV1NOFMfje30VD+iW2QYvxUSFJ52G7BDCg
 13gM6JFSkxhttmq/8I/8XRPy9Zppb2qX6AFddZ+l/qS7EKkIDzFkyfm5Nd22Hj4tfwPpMqW8FlD
 Gp6J8wKqRG4bxRsfyK/iLkuhS4LboEV38lsMyWcj2ZJgBkL8zIU4IO0rNS0sStt7p6bqDpwodBZ
 2JysVnnJSn0hOEOv2zKwJwRpLsz4Tq1DpqrWpN55lAlq3R/ayG1krj5lz60mFqKHA1Qpi3THEbJ
 xmmeJGpve2rqn86OMLFBSY/gdxIaNhxlvdy9GzsL3FTB8bm7+ZTeeYi3NKsxI5HAwjZdQjvhlu3
 xRPUuZ9wWcnlxClouUE7uyGwfYuBZmpGLsCkp2sD4QguvaoD9YfLvJ0fwKpQ6QGxeTESa4Nz8lm
 BtmxEOQRdgePYsoOBrw==
X-Proofpoint-GUID: a7aglw30N5rEvd2ybw6Fg3cfFayA7Q4B
X-Proofpoint-ORIG-GUID: a7aglw30N5rEvd2ybw6Fg3cfFayA7Q4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290039

On Fri, Sep 25, 2026 at 8:21=E2=80=AFAM Yepuri Siddu
<yepuri.siddu@oss.qualcomm.com> wrote:
>
> RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
> power path in hci_qca did not need to explicitly manage the clock.
> With proxy vote removal, each consumer must explicitly enable and disable
> its required clocks.
>
> Extend the pwrseq-based power path to acquire and manage an optional
> WCN clock. In qca_serdev_probe(), acquire the clock using
> devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
> after a successful pwrseq_enable() with proper rollback on failure.
> In qca_power_off(), disable the clock before pwrseq_disable().
>
> Targets that do not define a clock in DTS are unaffected since
> devm_clk_get_optional() returns NULL and all clock operations are
> guarded accordingly.
>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..489a059e519a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>         }
>
>         if (power && power->pwrseq) {
> +               if (qcadev->susclk)
> +                       clk_disable_unprepare(qcadev->susclk);
>                 pwrseq_disable(power->pwrseq);
>                 set_bit(QCA_BT_OFF, &qca->flags);
>                 return;
> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev =
*qcadev)
>         struct qca_power *power =3D qcadev->bt_power;
>         int ret;
>
> -       if (power->pwrseq)
> -               return pwrseq_enable(power->pwrseq);
> +       if (power->pwrseq) {
> +               ret =3D pwrseq_enable(power->pwrseq);
> +               if (ret)
> +                       return ret;
> +               if (qcadev->susclk) {
> +                       ret =3D clk_prepare_enable(qcadev->susclk);

Why is susclk guarded by the pwrseq? They seem unrelated to me.

> +                       if (ret)
> +                               pwrseq_disable(power->pwrseq);
> +               }
> +               return ret;
> +       }
>
>         /* Already enabled */
>         if (power->vregs_on)
> @@ -2472,8 +2483,14 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>                          */
>                         if (IS_ERR(qcadev->bt_power->pwrseq))
>                                 qcadev->bt_power->pwrseq =3D NULL;
> -                       else
> +                       else {
> +                               qcadev->susclk =3D devm_clk_get_optional(=
&serdev->dev, NULL);
> +                               if (IS_ERR(qcadev->susclk)) {
> +                                       dev_err(&serdev->dev, "failed to =
acquire clk\n");
> +                                       return PTR_ERR(qcadev->susclk);
> +                               }
>                                 break;
> +                       }
>                 }
>
>                 qcadev->bt_power->dev =3D &serdev->dev;
>
> --
> 2.34.1
>
>
