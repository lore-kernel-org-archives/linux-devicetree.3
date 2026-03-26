Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395734D4FD
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490355; cv=pass; b=A5IFyzD8nnpNRQNCN7WspkzNQJt9EdZxlSugIEgnPNS+mzL41LhG/7GW78AjuN25mc4QWIjAP9E3bCwv6uBXOYXdF0zV3rp1QfCr1+NziO88u492Nu8eqmJw/TrnvTrZBh0XfPDgI9+Lw9zztRMCP98OhE/3TMzHHlbyflVsdy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490355; c=relaxed/simple;
	bh=DFDO7VGoKhW9LibtcXJDRr/OcOi2kDPvbAzGM7JHtTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKbJKIP761Z5fZH89EDyZXXvte6UFtonjjjkDNgfIg2yqc6bPNLoUXM4tZgSPkf+4DbxxU/2WsaWJIyu7QpDO4djFxbHfgrmCqWUeS1WssAYBNHV2Mha8JtO6UIDkl+rIkfjUtFxMDM7MxgmN94sXjwOfF6WvCcIwhZNoeEotrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwBkdG+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsGH+u50; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwBkdG+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsGH+u50"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0h5dN779742
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jPgKrOCs8BV3rkHFf7zJrMHg
	/ajlW1vtOsuJgIMhY9c=; b=WwBkdG+bMNAv1+H4wYjSz+Puf4Hojd60sfYMbVLz
	6u7s1GcBAeZuf7rFY16XZRNNen6tUahqZmtZfxf58grsNZS90izuJb9GyiJNwA6l
	jyUtMU9c9gJrXpHrck5QXhLaP9mrc528Jd9uoA8GdtA9jR7E81ExXKHhYrVut73E
	4cXbuRf7ecmlOPp97UnydVYHUSGS0OAIeX3tJ/pfwMRH6KAgVVPs7d2FLHk+1Ddp
	FBl4Fp4U4exKCbvqP+V60vrbx6Lk00MyWfKihdu/ceUYWdPEjIB+Btbd/DQ866/+
	+Xeyo29QlF7hT/ik0vreVZ1XWS/2CHif9EzUZjwWwX9YSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp38y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:59:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0601ff3d9so7255035ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774490352; cv=none;
        d=google.com; s=arc-20240605;
        b=ffIObyIsP/Pm1OL9U9v8dbVdYSz7xAgDaZ/H/phNk/ufh1Hd/DkRYcGS6mNbRxMg8D
         4MCpqZgg/uVOmhpdNMY3xss0bRYM14THuIg92NO/BjGDSUDs+1Ft94Kbwu0BU9gJRWsA
         DxaBcKRnUyFzmgdVJD9LfVHEQiPs2F7E15Sbxt7sdjlSnV1qRCHuKdxffR+yzisKW9E+
         blH76OHBZI27nimR4iP0bV7m4cQXBNyn3386Pa9HiD8S7ZpS5oA4KidDuu9iyg+9ii3w
         nNk+jCBE3uzcTkLtoogAeIUoJe5LIKg4hZ+s2rqfjbRa9oB4rzjC4530MxIgKYYo5dUp
         jXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        fh=2dmVNgMDBD7Our7JEy00lIb1HL7v2GCEiya0mcTy5mg=;
        b=PhCwt1kHZCtzqOp+futVvyFD1KiaDx1xWJrJD7TvE6u59qFZFCsW93+dGXPUN6O6bt
         OaGctcSlicA/D2baET0Nf867vDgp/FXhtXrZrOwmbrmivs25hnwmfbmOrJnEHsODvXZD
         AJlnJ124DCHJus6VLGYOTjlCc2M4LxjGCPReCxkyrwD9VuxrgYflQYe3P5TtATJm1jin
         MZsGBPPQPl2PEc02qcnWyxn8gA1BbbOBOB2ale+WAkhNXKuJD3ZQvrZGGaNNFhCVr8rR
         zekLFoSAozbIfbp4vm59idkO/ze08zRDfREU09Ew8LQaUfmx11qLgR3+YLJ1EP7LBDBv
         25tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774490352; x=1775095152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=FsGH+u50H7hDfd5eY6SMzZf2ZvWyoVTnMNCWjJPTLS3kggeS/gFVcJBGGv7yziQsyS
         /i6d8hUCNePgWlYN7hb7tHmM7qW204DP/QnUdjnLIqnk/uyeTcrkOZspBM9SE7n77Fc8
         teBXf0BBTs+xTbv6mZBB527yG3Dw00KW4O1XrMifTRStePSGj2lATMjVECwswLN+l5XT
         apKNXqYLhwjZdLf+4yLkWcy/2Pwt7749+JZrnLITEEPo8EPEtCKl5HzZOfiHBhaN+4ha
         sPusz3Rg2PTtRTOPzoxQnmhxvnlfrz4sYKGx7cSz07nWGF7SMyV4kTb9Go2j48HizDj6
         OKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490352; x=1775095152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=M0caLjlWHDfT+xShi5qbo5wtxzWV0RboZHFhZbeuNjBsD2b70Nui5wNp+K9BOopR//
         G7UcvzqDruI8g5SEoQ8gg6EB/frYwNa5AWzBd/dImvjfbigWzyOVUL+WqkgmPzNwH5dp
         SVs1y4YoIflJeUSqhlaDfNM89nWczSha1MTeJovdJf3eH+hZ9ceLfBaoRxxaJoR6udgK
         GcpPXUv8YV04XyWeo6L5DjwMbP9gWawT1Iyn37Ij36dVOtpM9YPezRW9NhG1QT2begiK
         MBGJ4bEIuCoJ1fQHK/30DOGITr1XQrsnPfLcD2GJ3wBhyLBwuZ0qWio2Tsb+Pl9Ey0K2
         MuwA==
X-Forwarded-Encrypted: i=1; AJvYcCWyK4hpEFYH3yC92XKy1Gu1nLpg+R3hwaVnGbk8XUkw6v8b5Ixb2c8ijkIjUv+4kyF67ZcMWS3gDoEF@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfI5UIA8aXgENlPDbAclK4PFzkc0dMx9o4aY3cInY+2sz2Dch
	/RH7XzDC4wkhUkCqX2XvE+RyIvPeaW4O/tl62aQnb1NpvBszuBKRYycpjTQBpyzr8zetvz7yBjF
	xh0nbgaBnQ2//rn5ttNPnkUPa95nvNUxgVknBXeyqRfRJ5yx1iqw/nQrHopSZBTB+SJqSpMIzVl
	tq9KBt7nWrXuxN7NGPTDj+CgwkrzboIIv/xHeUrqQ=
X-Gm-Gg: ATEYQzxbGqhrC2KuhNNUwP1sRcIeDBLf4n9viyatCczaKF/znpbgZlPkf3CzmORgcQ1
	fGHg2iHCufEXl1KUMmdjSzn9gl3dqUHfdueDCORBaOGTorc5atmkqyTrkNvjF+eULBOWSz3oBI1
	NTiZGlf8eH3Rei7QyLvv4QtCOapB9y9jkoisZ3K2+9v/h+bnPj+8o5oriNumr6FLicY2CfFP39I
	sHkpfZjtpMaoN+/jXru
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b0b0abe504mr63387165ad.40.1774490351605;
        Wed, 25 Mar 2026 18:59:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id
 d9443c01a7336-2b0b0abe504mr63386895ad.40.1774490351133; Wed, 25 Mar 2026
 18:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com> <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
In-Reply-To: <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:59:00 +0200
X-Gm-Features: AaiRm515yskxcvd1wtiR9718njLTgP_TuNpDNdd4YtWA6E6jp6B_uzG9KDE4-bM
Message-ID: <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: n7R9fWQbmQWndvPlfpmdaXF0xN78fvJp
X-Proofpoint-GUID: n7R9fWQbmQWndvPlfpmdaXF0xN78fvJp
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c492f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=l3dzM3eKOFk7Ec1IfqUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMyBTYWx0ZWRfX61BwaKPuu9YZ
 SKbfiJGrKbDMHZJEZdiEUT8ctYauJqznf2ewOtzqAgHiCRdP+cKXS8fS+16urRShf6Mep1M3hh2
 CuxK4axz51eRyubGlI+YruR5nzFIO6De42s2zoh4KpxnfBIGa4ZlCLK8v9CNP61l7zCA/7TWVYH
 nVjLRQLDrUupr6N4XqZhE0oJ8ynjJa7AXVHZmVRx7vul3nZyHRBedFomdqZyCeQkAGc6y45tV4z
 yMtdnlzgiU2gBQu/W+9XKrT9Ge87KebXLmkUaz3Nlr4NJt0WbckQI8FXoTyl9Gr0abBdeFZKbp4
 DPLbE5nU/kxVUwiLUseI+V4lhBRew/qiZiQ6DXph59PflPLfaLBu13ify9DEpSwUSDvCt2YIXrq
 WdVEFJ9NQPHYi3ecbPXPsOSlMOfNDtI5Hdne9Noz7jqzCxUog3+Gqp26281pzwBdozb4JMGeSIN
 T+7upghVn1cOkfp/HQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260013

On Thu, 26 Mar 2026 at 02:02, David Heidelberg <david@ixit.cz> wrote:
>
> On 19/01/2026 18:08, Dmitry Baryshkov wrote:
>
> [...]
>
> > +     wcn3990-pmu {
> > +             compatible = "qcom,wcn3990-pmu";
> > +
> > +             pinctrl-0 = <&sw_ctrl_default>;
> > +             pinctrl-names = "default";
> > +
> > +             vddio-supply = <&vreg_s4a_1p8>;
> > +             vddxo-supply = <&vreg_l7a_1p8>;
> > +             vddrf-supply = <&vreg_l17a_1p3>;
> > +             vddch0-supply = <&vreg_l25a_3p3>;
> > +             vddch1-supply = <&vreg_l23a_3p3>;
> > +
> > +             swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
>
> Do you know if the GPIO is common for whole sdm845, or it's only recommended as
> reference design, or nothing?
>
> I did test defaulting to GPIO 3 on Pixel 3 and WiFi works as before, but since
> previous downstream kernel didn't touched GPIO 3 at all, I'm worried about
> toggling unrelated GPIO.

It is an input-only GPIO, but nevertheless, if you are not sure, just skip it.

-- 
With best wishes
Dmitry
