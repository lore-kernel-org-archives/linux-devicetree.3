Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0921A6827
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650673; cv=pass; b=Tumf9AY2MG+gxhuxOVvCn8YiCX5sQp7vsO+74K8uL2xCJsipXSg6wSmj26ALuvsKd5wo9pg4OBRUBrtl9C25y3zAboknTVVKqq+y6PFWDj+kEFamPkJA59BDz0i5qZqNuWZdKeIQHuQboebHHH9ludOeifPnMjdWdI3EbvLD4/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650673; c=relaxed/simple;
	bh=7Wd4WaS9Tw2LVyuZGToThgOcjG4eTJFKipKnBT6ahmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPW3Ee1G6FQ33TUs+uCaahzsM1t2+OzqQh8AKMioMcNqO/kH0+1eSU+sNG0E6EwhX3erEsMlqQm/UNNIExDChLrQFqOoSUbwmHZ9fKKlwYyuTk/LbFnLX19tw7Uh47nDJ8d1Y4x8s/IArvaGWmJfKdigu+uUq+FQhlkBAyfb+lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/0vK7md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmN5a46w; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/0vK7md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmN5a46w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfu3Q602232
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v7WKFHZa01ynUTDVkoNUyIYc
	RPr9NH/0nVWPZPdPQ9k=; b=Q/0vK7mda58L9rCaZiemnuT+S0aIHs/9Gy437+84
	nJ84HGm6v3yzi7uWYQZ1bPNgfbpYBJBIhNFpfxiJlG0tpthp3LgRMRzktJZzL5AK
	ROgcIUfbDMKD+W4YsLIh2zvOK0arg5L3BbNv5u5Abs8y52+zFpubV2J07rXvnd0o
	fX/tJ7wy8Bx+bfdCrGc9dktB8toXGl4Ji4sjFqCNRlRbIW6219WPxkFQUox/R+D0
	gUYFXvVj5GNx8MPKyPTjFtq7y/W4sOWUmbQlBtldY+Xt5ktx8Cupu++iOtoJsFic
	fTjT3+UgXOOvLk4zbaiXUuvRHuX0Fc07AbqjEOt033SKjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhuwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so2272269b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774650671; cv=none;
        d=google.com; s=arc-20240605;
        b=CXcxEkxqwO+ZcqJdrkzjeiDPtLHwb0pAfk4OMsKVtQVecAqlGyYiNBECqxUl5hAIlL
         LpePniXChApjceqQiU179yPNnRbFKqIedeSDk19QSxb5jKZ/sbxeW6NoRe8zI0GvZzam
         2DCOmQZ6xA+V3/FaR4gcnluEIkg17Hj9Hdm7ho8k16pxtB7rj+Y8b4L07azuQXHUivq7
         QUcUqu1KwgSBcv8yPsBLHXirrmQRRonok/xD3HMrefu9XfJk7Yo9bkHpnNuuNoPFvs/R
         xP4+Oq8RPnIlD6hAxCbR7NRAF5zNpwQ+kK2k4iWXYhkWu5+w/vnaOdhj2eGHiDKvINsB
         2nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        fh=Xogvl2WRhfqXf8/elCkqQgr+zjkngu01K+h7qWgtsTE=;
        b=f5WIg5LbH6gWzjEsFLEPMHhPa/HbiUAHxmRAGett/nW19SFtDOVLM9Sg8NJuexbo0I
         Nto7TtzqGel5kiemGN9uvhFwYfNyNzy9UcN8LXOVSFfCO99rjOgOkDlpHYxTMab3fn1F
         sut3wStL81eAwiKsksVZ8PazvvhMgHa97eR3zGOMz6mlTVbwhWzxHqvnBd4OwgE5xXjo
         Hkf/Fgddz34PwXE4EJ1nBhpTFCEJF9+Hqsy/QvF1Un4qHqtYdx0dktZ7yl4m0XFOb5Zi
         eYV2f4lpqMeKM7uvsH/IoPHTsHlJz/YbpU9Qx9eoMCALXVd24o+uAxyH2EklT8Ixn5xS
         EiJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774650671; x=1775255471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=KmN5a46we2N37KjJDBnAhup7ENWYaJ/hM4PH16BKqR5XsD0rEaJld7iaSE+GDna9RW
         XHPFrn/qQX5bqTpxsd8d2sTCmjbeDMOiBFkupHMEcYeeeSyB/p3pfagC8OjobcmHgcrL
         K8mWqp5KeV/OQhQ3hBPHlV5DXGYzmX8gddkff+6pbARO8IFIX8F965GdMSeKyrKLDPcu
         yrPSyGmc518A5Qpd/skXZ24iCxczcHdEDXbaID+PJVW556EG0UQSkrBJ0IGUIusn836U
         hFrc0wLJ8EXE0CnjVEFDdVxv+7yE/OfkLcptl6VS6EgcBOMbD73kB7ef9K+i+cpi1P0r
         vH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650671; x=1775255471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=eGqg+J/2kX8zVrr7nNDloGShPaO6sDjLGJWRNp+e9jfVeXIReVbjuKnUzjprYjTPzF
         ei+2xGK/l6bv6nUt8FFTCM94W2BDSIGRo+PkjFRglZ2vfQ4DP7WLB6TMeRPArB3QKHEP
         cKpUEUdDt31QzVrUrx6Rv3w5nXIUERh9rtecVk3DGFzatbzKkqLbgK50MHket53Eu/H1
         xyfGfhvEEOh837ykyv+9ogLz5ehrYm06EvOaZ7Zp0k3LrcK8sVdmEIBxpNlmZRbhfb1e
         /EfCMTccvLe9WL9DrOLzvhafly6h/hni++C9Kqm9wTWA9r1uKXVufw6z559xDCyL+Cgr
         TVJw==
X-Forwarded-Encrypted: i=1; AJvYcCXjwF1lmp/zB9IcKEHUdt8oFlIR2PGDRW4Nn6O8QDCRdx26wYXM/w9+54Vudso2Gly+H/ruDj/X/pf1@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGgz/NT4kamRC6XIYqgNJtpBBYBf+seBuvtlC1ylNdVgURwev
	+LUZQruhvORPaxNsrf2ynrLdu6r4nN0zDDrbTVrRAsySJY17NOQ2nhgDtD8XdsMre7FujNyUdtI
	iw8r/WKc/uilER7S9zjgxvchrDgAVDCRpQ6g6iCLVKMsvVmC4ychRqafHMA/YFqi/FP//nTmvBm
	edKCZWuvnK8QrjSGfVDtIdEMQMLkmwUQzxM75Sj4k=
X-Gm-Gg: ATEYQzwADi5aTKpqyQ4/+Lzcn6f9APOB9t+p74z31uIKwbtGMJSHI9Yfkc1KMtxcDv9
	AtxAQ6C0vn/rvZb4mwLZpzSlYoXKpgBIPcekr1ogeDpLczcikqxjqM2qMjKEEfFzWhjVyV0x062
	rtWMwinq+nQXwWlYxCvvYwjk3XATn6Qp/MH4x31jFz1gFZ97RF/zb7xLeJu09v0mq7ZgKKn4YIK
	7GSeub0tHS3KLeMx7OxVWR7kFZoKsevqNAH//M=
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id d2e1a72fcca58-82c960d66a6mr3844214b3a.58.1774650670379;
        Fri, 27 Mar 2026 15:31:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id
 d2e1a72fcca58-82c960d66a6mr3844167b3a.58.1774650669762; Fri, 27 Mar 2026
 15:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org> <aEe0uBeOge5s3CG521FGdJhY-snL7v7U2KXbg1IAqMn9oy6mslb2GJ9JfYCJ3RRE0L-Qr5opUYFUyBJp3qEraw==@protonmail.internalid>
 <62zcubxembr6iat4d7n3o7aecqtx3ne2a42ilxfoap65oaefhh@mecahghgrwrf> <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
In-Reply-To: <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 00:30:58 +0200
X-Gm-Features: AQROBzBzJ3bpD6jVINfR2GFtsJ4wmBDV3W7m5wN_gCvaCyk9JMJM982w8JUW8hE
Message-ID: <CAO9ioeW2Xi_yQ-bqH0=ST=dx6-1bPjnNEeT29ctdHp039_yeuw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c7052f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=M5UCi2xDz22XXY1QiL0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: cfCz9zbrsJvnWMMY0B8UWhAtkS0QnEVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1OCBTYWx0ZWRfX27SRiDa1cwVD
 4Zqv21qBRnCktUDOi9B9Q+2ubDxSaINVuQPEYJbBNPzmo1W/pXt0tkXrTufc3glsJ/GfGASil+V
 /F/JJm+UhsoXTguC//XI9SOwohPBhW29GA4ZL0HIwREvYaNA66BVp2LZ3CAgB1I4O0OOslRt3aC
 6s7esrwYrfUjmSGG6qcHafVHYEiBNC5O+OUIt64RE/yqC/nKeXvSz/qWUcUBg81rbCQCMFMZbRH
 jm7Hh2GS3l8nkho9sPqRWl/2b4gm9/7H8nOdHrajBEn2HcQI+SUHgq0i24UNEQvh8vlSZ/Ul5AR
 +Mn1noBWEFFBkIz1GnQmdJwJr1XPg4wAeflKfbwFV/B/Wjac1ohJlmBq/vcvcduvOdjfgG8VGv4
 VerUJFrVDg//9hMt6j4u31eWHVnegJoxaBMx/xPfiUYEFYYSSSPyvMH8G/pU9y3GBOBa7eT7u1v
 JEeAoPbGjCCpYSO8elA==
X-Proofpoint-GUID: cfCz9zbrsJvnWMMY0B8UWhAtkS0QnEVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270158

On Sat, 28 Mar 2026 at 00:11, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 27/03/2026 20:54, Dmitry Baryshkov wrote:
> > I think, I've left similar feedback already. Please rework a single
> > structure-less table into generic and per-lane configuration. It doesn't
> > make sense to repeat the same configuration N times, just with the
> > different offset.
>
> If you remember you also said that was fine for a follow-on series after
> merging, and you asked for a commit log to that effect.
>
> i.e.
>
> "The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop."

Ack.


-- 
With best wishes
Dmitry
