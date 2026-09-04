Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B244C51A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514918; cv=pass; b=amLZv43NDFwxlb98DRd3XQ1sAELxN1o7UMmgV6bVNU911SQPAu282T25FOL2LIJZrlVU8Wnja1Vb6glxcQwZx72SbH7Xqk0oGu6BMw9ThCceyJHJe8I4+8XIGxmCiIstB2SZ1IJ7+YKNIn+VB7Z2qU0dRFR8J5Lvl7nX2uMGNos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514918; c=relaxed/simple;
	bh=qRGzzdaOPo3OS6XeDCZ3Be7zPlIFi7jn0EjMfIZ+rxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoFLt8L3hX7dgR58fMnaSnOT6GI2rtzoxYd2Zd6FUL2udPSg43J2/+e4znDt+SzVNjguS3iEi9NIcrKE3qW+nqwlwnKWun/GFcNde8m/h4HuNfIzo+VliGQe/iV/uLl5blf5Q9c/FgKi2gcinHWggRyaPsHOnx9WHpdB9c5gFzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuzxoCzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8NNo92Y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuzxoCzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8NNo92Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mxvb2292637
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 09:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=; b=BuzxoCzS6uD10tGP
	S8/k97MAZ6tZ4xbSJ8ip7+J6EK5FS0J8ZDtPEoqRSTaaqEw11Ym2B0A16de2cARK
	3qwh8/KmJ9oHXTPF6+gK1hezY2WJqW1ELNPbVtpzosFgJDiU/NzE79hCigLbxjXu
	dcU1UhP306/q4Uj5JqeJWcmivQl9ri1vRs9390ykHBoBcFsuz8wICFQl4mpgp+AU
	wcupHf46/e3HCadlTy8zT6Fv3zk5Fy1xZTG0lirKzwNty/8PIFjgYjONMaAXVWhd
	UZWV66rxUmYq33OZSS+m9kFB5lUdX+ym7T0QcdtI3ywuUX0Ru95RXDUHztk17VXw
	EWc70A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp2y8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:41:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d932ef41c4so14181385ad.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 02:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514915; cv=none;
        d=google.com; s=arc-20260327;
        b=nx7SKB4Hyb3stt9VN3XK9zauFpo+fnypZprlCqjISuPlSJ9wogP+LLLKwbfglWwPl8
         rQK1yRQuNXZb9MRiNCjWhMoWJ4bb+Cy3KL4EQbwZPC6eUcor8BnRxazXMxCdNHsApMiU
         iKcAVylERgWWmoWQ4aWB711NgW+jMd2cUNXFMrQE+T4tVEdD2Ebot/wX02fjjYnqMe/5
         QgakBEd2wXGqLP+ACXOqaNHtFUimt5ZKDUQeVb6m6evyoTbkkh986YIQRmb55N5s1din
         zfB7QQySXhYRH8JBHQzoYZR5vADrdw4cLrcsCPADGMHCbTcxeY1tjCfvZUpS6wVVrKP6
         5HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        fh=kZy6EGysKHdUNiMwSWQmcqU91EGfgQ958LtQXtZwEug=;
        b=KMsSqVrB88innPdzKMfaf8+ilect0fLcCzYTuchK0m9veGFcTtP3/0QkmnBXOGV6Sf
         LtN7pFyFVbKjn/6y4XqkhC5kxsdMhjkPvplxUwI4RAgxT7mBIpgmo7Xi3B5mjWvyj2jF
         Q8KkC9aG8Hnh8jRVfYgE/bkfjhW4YpZyXaBf4x9F1oF8N/f/TK5wl65nY5D8HpnKWLyW
         VsAxonscj6L/X6Nfm6+BuphBW1A6k8SgHos9OwY0hQMxHle4w/+f5WIA/8hUSC8buAVW
         9cxGLtQcFTxvglnsVf7k5CR1vy1wr4ERGYNIUdn1C/wAtcPNqygMv2QDEoVZOXiQuxWD
         BRUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514915; x=1789119715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        b=J8NNo92Y2zT9FO2JwSrjM75XtDkISaPbnv61Z1/oHKFd+mdAMxk4cdzkfZ4nd9Fn9z
         CWxNXZ14tDqUlKhDLMZiSBAbdGpCntzyVYaTS/CV+GpCmt4Zq/gUa3zikkrXDHsD4Lo6
         QZRWKWfxIRIZn2T6kTyz3EuLYVzRo07ajmPZgFGV6v1d+BhiPO6GSjqyV533wRznU3RC
         KuJMrz2Ipsr6F8m4ZaX3xBxpjysuUQgrZJc3gHGrjG8TtKlpmfLDugZxRmDz7hWzV/62
         fA5lC9PENMrdpupmgcnWYnO2WVc4ygJdH+jrLLLPF/K2njUkopO8XeZ14l0Ta5c461zB
         50Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514915; x=1789119715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        b=IiMIyOwPbz0ZbHj5Q7QppSdoUUHDqghZYrhh8rYvk9+qQbynsQboRXVbw84ns/QV7p
         ZdM7XiA/IfGZjQ31PnahywPn5MmGYzMhVDQoail0Nj1XBbE7dHBztB0Lg6yoEa0OKxoO
         fpyAAAEb34BGE2v02YKeN4rV0m8pgqq1lfePVkvqq3f8yeXzE3Zhjxp5b2Ya56hmo5bM
         Znr5U7WXq+mVDzO7hM82BEWLpbjdWqBCQZzckUt6gJeWVfWlbidnpetS+U2+RzB9mHZ4
         LirrEnXeVMYAseVP356aZsCnpOwOjNPrrllHDyEB7O8j5iLOkTv9iwNPK+QxmHCNByUw
         2Tfw==
X-Forwarded-Encrypted: i=1; AKwUvBxO7pjSF8Vb7vE+uh4A/wje6Lhzh/YMJ3Pqb5sKHy7Lr1v/FDcrGlDwUrdeiXROsWv+CpKFVK8ifMu4@vger.kernel.org
X-Gm-Message-State: AFuF++l0dhvnUqTTOsOMVA0+F7z7sDCqy2K40kzqh1fUEEsgZu3Osutg
	AAlvSUXqNcbH/DPUe2cLzMjdJ6Wh0by5btzEtWjzdpxXNgt2DYeYues6mPtnX159g9vmqnTRL1C
	Mbgi2XZjv5gkFWqWEai2xgmP7Q9gI9l1X/BavQmro9iNAw8MU0aItXJFr4ZhDPZcp1w+173S/a7
	Bm2qsqkRvF/gD9aIBZ93bTpZRegvNQxF/RDBZukt8wUEO8cvw=
X-Gm-Gg: AYBFou04WHjFqJeMC5S5Z12tA7m6WSLaTnm8gSGskQpWwLOrgQTopBaz4A7NOAuTxPd
	6FnWGoUNpe3fyxbssvCRWEHljJ1V+bdbBYydXKSzJV/SimfIi3f6slLd32fkwdB/tWcDSdhQ2Lh
	DZp280zYk22LzToBISEzCwp5zeS4qSG7u/59novYx5vm360L6mzWkbuYR1Cg==
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4cf:fe4a with SMTP id d9443c01a7336-2db15bd9addmr33760755ad.16.1788514915376;
        Fri, 04 Sep 2026 02:41:55 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4cf:fe4a with SMTP id
 d9443c01a7336-2db15bd9addmr33760515ad.16.1788514914955; Fri, 04 Sep 2026
 02:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806162202.657512-1-jm@ti.com>
In-Reply-To: <20260806162202.657512-1-jm@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:43 +0200
X-Gm-Features: AcwNN1WuovdSU_2kEKvHD8EEYyXMloGWDohy5Yd4DT2AHl_0YEhIymeBDEfX6pI
Message-ID: <CAPx+jO9bWbwzZqgjW1pzYwD4OfsHLBuxEEsqkvzLgF0NLT4Rmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: Add power_off_delay_us support
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -MVmlVNL8jc3caYmWHhRVU9mxtUN7mKM
X-Proofpoint-GUID: -MVmlVNL8jc3caYmWHhRVU9mxtUN7mKM
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a9264 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Z57f2_SGLxpEgxUGCI4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXzB3BB8WH0PHn
 UsaGl7fVE6zS0wKTK2n7U5RRO9+nUpHnRhTWVxd2lL+qBKfiSKRMkEIg8kw4bbgt53eKvfIFcmT
 t8YTLFl7xdIA358tsGf+dBsTJcrFETRvK+M42BaiXW+NF+ENjRaMsXuYZouwjlf8LGlDDsqGmyK
 fSg9Ls0eWkJnJQCqP+1h+NKip8SoOF65/iyC+uiq5wKhWPsulaZr5HDh5cSJkcemPeiUJl6b71F
 O/I0VFCXNIGhwsSBbBfzNoghfNrwFFHkB8QJo+k4mZMsqYv+vnEhOZDA0120y1hr/Fq/xpwUgFJ
 JLASnT1vxA9vU74IUHIVeIcsDXzDPeyNzqad8OKurWJ2S/a1V4Qma5r2f3Q520f3Lxw9PV2ZGLA
 czqKClXFMMQA0NyxZnisZCM9sW2dzyeqSVSK39ZXibl1SoamqPLv8Jbnt2K7nbjBxAsll2MhJHn
 8aZjr0X67YWZJ/80X7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXzcuxCgO2x/3g
 W9HxzO951oaFSqxuK/p6Q/aUcW/1Xi4sOfJe6+f9gvGUCHLk7Mt4Nc8sUpHTyNCPHTAAakEpWPo
 v4WxAA7KUp2EGvfC/nBdbo4AMMZV4vw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Thu, Aug 6, 2026 at 6:23=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> This series adds power_off_delay_us support for MMC controllers,
> enabling boards to specify custom delays after MMC power off to work arou=
nd
> hardware issues such as slow RC circuites on MMC VDD rails.
>
> Rather than adding host driver-specific workarounds, we abstract the
> implementation into the MMC core and pickup the delay value with a device
> tree property (power-off-delay-us). This allows any board with slow
> power off requirements to configure the necessary delay without code
> changes.
>
> The solution is minimal and follows existing patterns as with
> power_delay_ms. The allowed minimum value =3D 0 ms (early return).
> The default value is 1000us to not deviate from the
> original 1ms delay set in mmc_power_off().
>
> Link to v1:
> https://lore.kernel.org/all/20260716232641.2659710-1-jm@ti.com/
> Link to v2:
> https://lore.kernel.org/all/20260722205701.372789-1-jm@ti.com/
>
> Changes since v2:
> - allow 0us as lowest possible value (early return)
> - Change custom logic in mmc_delay_us() to use fsleep()
> - drop dt parsing checkers
>
> Judith Mendez (2):
>   dt-bindings: mmc: Add power-off-delay-us property
>   mmc: core: Add power-off-delay-us support
>
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>  drivers/mmc/core/core.c                                |  2 +-
>  drivers/mmc/core/core.h                                |  8 ++++++++
>  drivers/mmc/core/host.c                                |  4 ++++
>  include/linux/mmc/host.h                               |  1 +
>  5 files changed, 24 insertions(+), 1 deletion(-)
>
> --
> 2.54.0
>

The series applied for next, thanks!

Kind regards
Uffe
