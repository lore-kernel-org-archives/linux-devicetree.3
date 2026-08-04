Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55656393DC7
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854285; cv=pass; b=RPnhXohGrfnJJm2fv4Q9e40yZysWK67rRZjKnGDNJIYoaoVbu4o/ZRLKgmNwMR6z6aNvdmydE7/YXFD5b93/9qVJp3xJwby3OMJU0K6bxNLtYl9OhE+ss/DlkjZ7VQDNhjEY5OvICpD3GgX0MgGJrmlTA4Y1K4EptnnMYLRMw2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854285; c=relaxed/simple;
	bh=jku38Es8CyiN0tME2o8xaTarqmox1Wkwl8kBhtxqFEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNr1EYsv5oAdciTMHcI1xVybDXprMQtymLu+/LETVEcw5YL8LbV6frqUlx6DKs0YRltUAUubM0T/ALXmvk03CEwFt0OTTL4CLNO1uTngqI8180DmVDhIrQTFaGvBz3p+u90yjezfjjlh+Uqu0sR3zMG2fb8XpL3WGAhCFDDUNGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of8sOQp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACFJdZea; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of8sOQp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACFJdZea"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXWk64144223
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=; b=of8sOQp9xUSfTu71
	IHMwC4jMPpavp12E+ekTQze2YGL05ivig4ZfN52E1ZLalg5gz3McVISQCUYoa5R8
	122GhAoYJvhNsWfxgBqKfKB46LEmC9gqrflOwl4QSG4j+bVHBIemZ+AquCwJ9oj3
	HWJjwrlVjKveGsR3Y0mTvtHHYqY0VuSaZKoKei075ReWkK0deKUQzR3cg2+qbrDg
	L2AHymVMoS43fM4uDIsOvMvq7BZ73Y37kzegg1uvEWooxdryIlgcn7WMwKCVyhPm
	E8EY8dw0UKfYsQW9dMassyHPtfGMAaArB/IE3pWDce7FmooGveCBPXBqS1jQ39N6
	QulxNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs3h1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:38:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so455759185a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854282; cv=none;
        d=google.com; s=arc-20260327;
        b=O8NaeKdvBeLtqUHgLeaS5dAvXqIq5wP0sMuFj7GYXpNd4alQFZd+FMtvEpTq6ge+UW
         sCQheSio5yFTNDA79t6/Qd/ow5WnV8BE65ORQwDk0NdvDq4TbY5xO5DUfMEHKpxt15QY
         5+P/m24SMbrvsXvFSTUnvqTtYax93smVZ2t5N5lmG49OltnzWR0puZ61Xf0BT2N9tqLR
         XaT/nAA6s3d23cBAlLk7OFiPtgv3e/g2J474QO0OT1ptaKd3GQjFwK/P/9LWeS3kIgHw
         8E3WgmwDI8mgOelRERfCUiL2U07Uog5Dee7L9jtRrxtB+8qQgazh0U2ESKanO/rXobeW
         fIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        fh=rMDYCn9aukUViNCHSlcdUX1By/ihwtIZm7ffaxxK/n0=;
        b=JxO/ovdzS7074u86BcWy2+z22+3b4HR8HdnqqBMdSso8ifj4VRwd7XFHko/xyphBLi
         z5L9SrHVIF7bagPWLd8UMrXnwqzdvEA75HY+Jg6pWGXzv5g/MkbcH3GQ2O40jaSSNpbQ
         /WDmsbhBKZY0avqiMZ6kl/zKS/NLjAeLls43KvT/eefpU8Kx4rsxdXknk5kaZAIj6aKj
         TdbjFx6cehQwiyEEZ0BVP2ckeUuu0O1FHjXVZ27AB1sE3uvaEzYFlpqsG7yyBR+tckg1
         8jxY7vW/sx9OPEVovit3/kcvXev0JlAvgxMitW1MSZu0i9bq7kYfizuXIZwX+BFCM7ec
         n+dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854282; x=1786459082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=ACFJdZeai7GnUFPlLjnexNtnThdq1eiSaVJ2JN/nnDPypVKe5kfKS798J8MnAEx6zQ
         rqug3e/ZQLQguN5apKeZGcpgHNYbeHxQsrd1ISWrM5030atjf6hk2c/ZgFW0P+8AQ4gl
         ZUAk4oa5xW4NESGSjEfW1lmZtiIG7sjOio9MSLSt0Do9PS/XjAL9MbK2qiAOxULbYllH
         5NJGZZxgjvw4HFA5GvQVRdokcnUrArLSYFBSmtgfxlNbnLzLPrZ7vh3MkCZJWahj3u7t
         du+DMqudliBCJfR1617tfBFyLbGtd48P1x9IH/Kq8bKg5dQ5srpeB9lC3RtoI15bdRge
         M8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854282; x=1786459082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=Xi3Cf9QpxpvmZtXhtPLdDu+9adgFWtt+KFzLrvCXrgt35qW3CAJPl9Ua02c+yUi5GW
         QyxUDsUYWGQsEdnBL5hmANqnQ//WxtQ1taQtFBUbPX8Ta7w3s9US15cujtYRTVzgSzZR
         Gx1Tf2M1xpm2aM0QlnLA1BZpf6Rtv4Qrsgd/kvHdiFb677Ne8LTiEk4doeNwSQZC5B0Z
         OmEXuOdQEDqmAOcWhHIcXu10XiOjY6cTGzwpzMykJ3ol8a+1AdTrR1fFSMrHlVCtW9Vi
         uLmnQYlmAdjzztjCpzjU1O0r8iGGPEbSltAfiq+ThecScojjMGRLPysg+b06QaqKIxOg
         kBIA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi0zNg+BmbnvTrxiFk/5b4nGcp/6F1tsKjDxuFIBd1se6Ql0ceEMyok6gUHJmrJP4vfToDNjS6KKRO@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPVotv9sTaOL3R/gn27p1rER9P6gEJWC3e0negMgLkWK7mSUZ
	JgAUAOJ/LTlUoRkdWcCPgxWQuGDDT/WC90NBdBVnpnLK1z5OzNBj15wMSAJ6IXmwwbWEmQ1Ap+a
	O6FW7eDkOfDbSc3PG0coSWceuG1olyJNMWwiKOi+NUV33buzC1XXPPeLZ0G38cn1dwTssJcjF67
	afOrYs+t9SQjCnrEzqHYdmPJxqVluABNRwYhfBkaM=
X-Gm-Gg: AR+sD136+jkmL65dX+FTvR6id2wpib4wW3x2UikjVoe/+4PEBsx86F2c4KFUQXTOSc2
	U/VY7T3AZU8TIGQCkwcT8ieRTHSDkHLK0ZR4iMgJZHLooxYLQPdVibTSHZD/DAwFGIbxz/7nSk3
	YcRS5zRkOOcvvzJMxJ1qEUIEepFS/54UaY+GNi9AlhN1FqDLVFrfG1sVD61A==
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id af79cd13be357-934a07523e6mr2091177485a.2.1785854282344;
        Tue, 04 Aug 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id
 af79cd13be357-934a07523e6mr2091173285a.2.1785854281821; Tue, 04 Aug 2026
 07:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
In-Reply-To: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:37:51 +0200
X-Gm-Features: AUfX_mxidf6ep2hrmZtMSZcppo4HDdyELeecQKKRS0CT2NESLqRaSdKaXo6bY6M
Message-ID: <CAPx+jO9RBvDJHSoCT3QVUCfGK3bLduhV1W7T7VuHipOvas1v+g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Power: Add power domain for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX8M3IN6yVlpmS
 GdRvumOOU16sD3KZwpS1BQa1DbK1o1HpAq01G+dEvEJaaa20PU98yOHbke2vtFQA8QCQ7n95Ck5
 9iPo4VleOfk95lGgYbbyOcnML8LJHB0cx9wjGZ0WNx/ut465959XVSyFPylVEMVnEnw0ohdS2lt
 qfd42vFdOWQhG4aztTqGuV7AABqx7ILaftkpaITMTykGOsfiKVYhJ1Tb/VUwPv4o9cO8A8kwRSi
 7yH86QVFNaLjtt5axhSqX99mtzSDjGHlSdJi0K20OpNCqnQt1tIwQqKPXNRsA6rQGXb7LVbUJAC
 aOzo+jqk5kWxS9a+dEBiZ3PqMafaNikhNx4P1Iybku+9v1xDwBjrK5KwBQTULlbOOQsdXcY5Q3t
 b3hDpOrTn+xIcHPgDrx6X9hy/xmaDG5jV7sfrjzoYBP2LQMxS4Ty34GRSlb2gaXcWPy1T4A8THl
 rRoK1vZTeq4p0vIpQ0g==
X-Proofpoint-ORIG-GUID: _xlx1hXOxdG02oHwoBFIVL4vvYKqhYnN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfXzUTNSv3xwkUt
 /zuwBb9qiBB3V2ziC9qehgZXlbl16KWnQsZWj5mBOERipe+kZ5g+l2N2CkJWjTaSOaDl5u6ciNK
 nXnWibJqcjLaemamcjlQi8iFmRIsj64=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71f94a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=stQ3y3mWCCOjWvy4rzMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-GUID: _xlx1hXOxdG02oHwoBFIVL4vvYKqhYnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040118

On Wed, Jul 22, 2026 at 10:39=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic A9 SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (3):
>       dt-bindings: power: Add Amlogic A9 power domains
>       pmdomain: amlogic: Add support for A9 power domains controller
>       arm64: dts: amlogic: a9: Add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
>  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 10 ++++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 69 ++++++++++++++++=
++++++
>  include/dt-bindings/power/amlogic,a9-pwrc.h        | 61 ++++++++++++++++=
+++
>  4 files changed, 141 insertions(+)
> ---
> base-commit: 544455a3a844edd6107b15cd0ab0b657399f2d49
> change-id: 20260722-a9-pm-3efb3f2a4d72
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

Patch1 and patch2 applied for next, thanks!

Please note, patch1 (dt patch) is also available in the immutable dt
branch, for SoC maintainers to pull in if needed for patch3.

Kind regards
Uffe
