Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1046D3E171F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487173; cv=pass; b=QVW6KkWvJvkYwFuaWju01yMbXvmPrDAKnq06oUQ5KNpgw1Qp20R7KD8sMorxZ3TVThqwGiOadzkSwfO8yY3Gp2bKCA3zIy6az65Os1Hzi7WJhcSVQBiG6x9rTgQ4VDdTaqydZcXkkdKe1VYAiP5VTf3RgE/Rtc1rrhefQo6W8X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487173; c=relaxed/simple;
	bh=0nzV3Au5hKldE1LyXy81nTzzO98zLS+bllEvCWCXyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyeAcng0pYPHjRMh9LFqOmf537pBfD6G2VDr4Tch1ANs6FxgT/n+qfFtpoFaQcCcu5Q0EhXfbPJ80oOorIWM2nHhH29xB+w0q0aWfucB87R/U8YXNeVJqUz9VlJ4zKguQJEbgR5zX9BKfGkEeyWztbdmyTEH+m4ut4qqbQqiAN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0426o5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zm+5p/AY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0426o5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zm+5p/AY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8bfU43389876
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=; b=Y0426o5DtAmpV+CI
	pa9mC3woijvQAOSlCbxssCTGjzH/9SyPVjH1jOdc4ONy7HX2LtjtlCQZV+pBSORq
	BMyq/waKEb9hCO9u1nC+yzqk5caF6dVBfg39rEORc4E3d2GR1iJnWThRE1Ynue09
	5ebW5LPfCkp+baXesyO7CTvBAVuI4r+HRlj7S+l8tX42yRy3/qGBaS4hm4xnJapX
	zj+ZUOXWxFNFl6VWRYa89+uKWtPxfiYch5T65AY3hoQSRou9jxqZBw2oLajdiXPX
	nSwn4106VfDFAUzryNFM3GOgDiJR12oimHPrSoryWJ3NgQCOkmKERuam0pOUatkh
	GEvotA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g06p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:28 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e71268bf6so23988277b3.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487167; cv=none;
        d=google.com; s=arc-20260327;
        b=pd17/vd8wb/Dk5rqJKbojBheSM7w5zskhI+IoUJrwZLHVmfZR4OqKj/O9iviQA3z3n
         qBENA8NJyRFE07/xgm+CXLBwHZxlXpUs18qFuw6D/VurtWK+JM5RuxnP1JmT8FFmdw3z
         mK3zcMfkRymhvvLtDSgtLlkaPVvhejbld0fLnWkt6pZE4JcKDzsXBntPAFzcvNYa4Ct7
         0BjMY/UUTtC5erehpIqZBcbEsBtuHpDkqWLewQJqRXG02hlEDpNV5RFJSQGZ4zCTH3jh
         O/nwA+6snEn6UzexdIMCw3ICE1pDR2T+k3iDrTGhwqzTqtnRYFPcZZcwatK5462Ug6d6
         zLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        fh=sNZd/mAqDg0ezfKs/J5frMsXHbBbHZDM8No3dnD0hj0=;
        b=nR7OzT8o89kFJyLWmLAJKEUd6spOCG9DiGuzpsBIDmmVKT4P0++NNdFFvouILM3I8j
         sDcA1X45BWNrzoLKTb6ntuBDupfvEJZ3aA0B2dAHwaGrfWEr/I6wqCe/etMOuys3YIIE
         VX82yVEvJ3+a6Tp00S49qZEJ/mes2v6Ky4s290SNhxH8ou9IxS5PBj79SWLzNUvtuCE/
         YShvrTpM0KRxIy2WrUKMgU1Dfc2I0RU+PSRQxuA1b4NeOQn4Czght64fU4PdZrUPDEfN
         CL3AJekMl/LezBRtBp11ydmQGbpM7VKYDse516+8gyeMG5bjAPZTEiQonHI0E16u0H10
         3r1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487167; x=1786091967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=Zm+5p/AY5vlVLVCNQAxGyRVCMoZhwl5WGrfKcHgMxSVizAIeQvdTw0SdY+sT1BX3DW
         TtiVSC65bwNbUOhY5pFU5acHiH59SZFjnktppBihXP4ok4vH2zcguIJQmqhZO13zgCRl
         aiAhh/E+Y728/pwAQRloKZKtb44xH7CUw069iNQqGBGtNCK125F6NbVMseKDorteVwd2
         WpVm7AyhHP29gyLvmbx8rvMuoZlGr4tw56jqW4zLE08uj13f7n5nC16DXZxYhf7AKHd5
         6SKpueDWvgKzRfP3tAx71AAGS3MqRDOCdXNGapwmIHBKcy8iTifzefRwC4wK9KSZHYoN
         HigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487167; x=1786091967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=IVBMh8j0BFNIxxLpE/nsB8HMeooi+C4bUcm2BM0E0pA5ep8FsgRNX17jwJo7a+Ivb2
         XGz3pqOdg+4EE4nBWcoYJRslr84Xyl2vCzPGtsMlRu1PFb92iZLIdzMfpE57Ump0rdgz
         3Xu1naREQy0V1aorkXU/bA3Ui6tyT5Ngi0r3FgSmgBZuVL2+i/v7vhip7xt3YDfwBeEe
         OEauCwyKy+xsf4Y7FLZrh9GKG2c42bhzgp55fy0lx/vR3dfdFgAh5rEiCjjO9X98nALS
         zhnjighTOWe+bV8V4FYCDstNWU1xtbxzZuet34JGnClY29TPBGBNynBrzF5u3iZ7l4I0
         kXCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvnUhJnht6LfVX/c/CN9cTTC/BszIGl3NvsuRIq29QWZf0VBufhZyre5s+2xJgLsqYGhpkggMiofqu@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaRBWeQEaz2dT6H3f2+Lx6ih6ulWjJWqqBqkKRRjJpvBT5XUM
	l8KPUghxEV9WNE9LqTgQ7b2dqvlyPHX2kltIGx58eAxuPbqRLJf78FrTLZgqtUXHFDt4pNOueT7
	a3rY7F9Co/KTCua9AD1iSrUdL+LCjVZlqQT2N8gggP6H754SDMClqMIE/F3/kgh4B68oPLgdvyi
	vZk4X3cochstnUa2uLG7BY4dN2WXbpO+SpUrrXzAU=
X-Gm-Gg: AR+sD11GecnU6ayxckUSXexOl9dp9Ry8XUq/KUQFyCJgIhe5mYS2XV/m7aHYRUSv65N
	aAtEJWljy7bJxx4FHBviJT4fY/Y8DxAsolVOGRXMvyWnZiQTSvuaEBoNaVtcX04gWkGl30fsNLu
	f8Rx/XnM5RFE+G/vvTykUdmQBU5LuxbiCgWfkXWBSYOw0006lkFCphdhwJ
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id 00721157ae682-81fcba86c09mr6967507b3.31.1785487167411;
        Fri, 31 Jul 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id
 00721157ae682-81fcba86c09mr6967197b3.31.1785487167009; Fri, 31 Jul 2026
 01:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur> <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
In-Reply-To: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:16 +0530
X-Gm-Features: AUfX_myayjkpJROHbmEgd6_YM-8VOlEVu55qy_zXpmBuYnmJ9VMnESXGGquBttM
Message-ID: <CAGptzHORxaftDtf9K5pCLORK0kpdfP4RGRSE9iNkm0Bf+ZqmGA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c5f40 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SwCItUvQPH3YegUC7JoA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 3hP9PwEBlTce_G6bH84IxLuTAWmcP6Fd
X-Proofpoint-GUID: 3hP9PwEBlTce_G6bH84IxLuTAWmcP6Fd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfXzfyqr1c98ba0
 vMRayYX0bba+VtVljRNhch5B2AfuGYz5M2TUXYm5uBqaR2lUwaPNu5mB4Tk5h3bkNXrxyM1fyjz
 2PNnOI5a5Z/8YcokOT3Vyncb/txeOT+l+N7gaVtg8o9SBgN0aLVJo7LG2rneDw/BzTMXwKrmeBD
 Pwp8ufxlQiwvLN47M80og+Rlvyq5twbpNzud80Kigv0SMRmOkDNtscvp16V77bxkIFdxGdhfFnn
 1zNaicvZ5YhH+jragxYoHpDwFp1izRkORKlRMdy6GyVxAM9Ka+Xqe/YtFUfxunMgDlhh/pjR4d0
 j0XuMVaxjzvlTSAuIbeKO0TGVllTffbEwolllq/LbhJCcWDAG9w4N0czZUiNCbiYf2ZV6/6jKBH
 k+RrVKqrutIw/6ElnCIS/5JUYEi3wg2St4aYEdzV0KoZ8f3t1T0lf7U7RrS6vCCQst0M7cIZ+gl
 Y5YoAgIZO/+ZQRxy6eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX9vktpRv2XjML
 u/8b/BrjZC61zJ+wX1AA6/RKa8FivfQUwYwBpelpras5TRb6pTVXmCtZaAQo5dvJbaqOCLhkTu3
 7OniiQ5U5/tw7YCziZ1VTMose5la7Nw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310062

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Bryan, Mauro,
>
> On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel=
.org> wrote:
> >
> > On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > Switch qcom media client drivers over to generic PAS TZ APIs. Generic=
 PAS
> > > TZ service allows to support multiple TZ implementation backends like=
 QTEE
> > > based SCM PAS service, OP-TEE based PAS service and any further futur=
e TZ
> > > backend service.
> > >
> >
> > Please find an immutable branch with the dependencies for this patch at=
:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 202607=
02115835.167602-2-sumit.garg@kernel.org
> >
> > Alternatively, if you think there will be no conflicting patches in the
> > time leading up to next merge window provide an Ack and I can pick this
> > through the qcom tree.
>
> Just a gentle reminder for this patch to be picked up as only the Qcom
> media client is left in the next branch for migration to the generic
> PAS layer.
>
> If there aren't any conflicts then please allow Bjorn to pick this
> patch since the cleanup patch dropping the old SCM APIs is blocked on
> this.
>

Gentle reminder again for ack on this patch. We don't want to keep the
legacy SCM APIs just for the media subsystem in v7.3 release.

Can we consider it as a silent ack for Bjorn to pick this patch? This
patch doesn't make any functional changes but it's just about renaming
APIs.

-Sumit

>
> >
> > Thanks,
> > Bjorn
> >
> > > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
