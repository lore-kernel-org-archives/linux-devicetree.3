Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22353ACA54
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574300; cv=pass; b=HkoU5BapnTVkdrnPORR3N+XwrYOQAYvnb/1ofU17qKGqftd+Dpc3cZwx5gDd+Ff6yCMYwT0q3QhUVJxJD8ROGH+u/QiVx9WwMgYYzsldfvOl4HK0N8b5VH5lUSFBrul7gpKE9G7LmKbrkEFn9VOMy/Y+HqrHbHv5f3W0f+edg1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574300; c=relaxed/simple;
	bh=I9Mp/Py13xSxFWieB7EbhwjPp/EFqEXl6CXyIvK73sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTjVgF87bZ7IVHcBO2Tt9uNUY6wrIHV6cdUiGy/Wc66xKhfqfwf6Q0KbcDVoFHXCUV6lomhkUj3vcsTPPZuCZhdF/0jzDkg0tXFAJ6MSCfUsbyKN4/NcuZ1drH4leESgMN628xOCyA4CAkYi5h+oA6y21XDS1X20uhY8jiSc3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnlEQq0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKb3OSTt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnlEQq0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKb3OSTt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RIKEEx880323
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=; b=AnlEQq0rZX1irCcW
	e1eybMhm5vHLxz5hTbuHab+sMTVHDvt6joyW67y35GODMR06qdkalK8lqGw2/+kV
	OonGx7d9eWraCLsJSZtgG8CuOTY2bq1qEQoWyBXfuvcZMwS/80AyTrNvyFPaZe4e
	BhKW8SiuT/f6X7LxLBZw8TLjXdZApQ+0qhsImm8lVdD5bGieALA31FDkFDZu+WUv
	XqDtkqVdQbG5MyQaHyDFtSor/TfA+vjLzzrjng4VNN3gK4Ck4m4dLzLcvC3s50Qr
	HHCy7VoQImDgYYgIEC0BVSRgG9MIRoTnbTftATleLWUl6y7MkBQqk6Ne2jHCZNL8
	I8ZnnQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwcpux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c73057f18so2914242d50.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790574292; cv=none;
        d=google.com; s=arc-20260327;
        b=T0ozfcuxe/QQijsuVviBUMwRxk1pueMsBUyykVJJQkM+38JtTMznThqX6w7A7bZOkT
         WqZvRmOKMTFlT0oaQ2wen9mmFTiFHbWNKI2pI9VRlUzdtqqv2KL3cI3eLP8MsGaOwMNg
         RWb9y9Y+c8aBqj52ZWmbufRJvzH4ISS62TxLxSUr1riWF9n+2e8A+pNMSJvw1TcBycaO
         U16kZbebdF4gcSdOjPTSXT6xBQOu7/UT1wB1vZYwWy2hkJua4DxyJqPFR4Fp9+NwjM6k
         eNFyFJYCIzn3MwD11bTBxXfnnl43C6ey+Tvx8HrP5YrUgwTDMmCb/Qd7M4uJTC+bUgKQ
         GyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        fh=cryLiqlonirMB9T+GC8/qPazQJEER4CybC7G7/+P6LA=;
        b=pDmac4g7D3OVZiKeNeYje/ind1xpoMg8po+Ul1DXBQwYjU0S337pxnr2KrLH5jhlvq
         bBEVMznDH/GkaMweOm8i5aZlX4VVkaAuecuN+nqM3UUe7WkQKjb3R6tuCzuyh4xqU3uU
         o9EE4290cowGWABLLvzWBX7MG/cz0zh8jfzF4I9K+N+fbCtx8QRw1AoVOt0s0ycECwJO
         2IJdRre8S3GvpCOpQwWMTcKOPZILSXxeFc78l7SQ1eSWXxysyQ2XjqoxeBS38bDkd9lj
         EXcY0eg1D+tfcuVLsssBoZf55ahEA31vTkbIZQmCUVZdxtOJvyS5E9Pr8bYo70XBnTqF
         1FIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574292; x=1791179092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=OKb3OSTtXcbXxLH8ak6HbUTJDuH1q+y8yM5yRA9SW8J3ykfhl5Hc6bnNPSvn9+Jp8v
         WRfIKZveWUD+rlcvc/Durj01iyy5KJQnTL/wVBZJ4xq9Y7f4hdDufiGLEAfgE+YmFBp6
         yQhLjAwUPDYRZqpMKSJ+ADN1nFTYREDQaAj7uDUszPpsrUlqTH0MP2XxA4outVFN/703
         1klRLVqapIz2UNc0vsbj6ZxUkeCkOgzlDLjOxE8YniCKzUOLsR+xGMYN8F4efgjv68/Y
         yVfNdnxFeqg32Dg7YpjBhJxLAsYfK8aQMIUzOuAeGe0MNHnrGHI7LDXrTnCph/UgLiok
         SCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574292; x=1791179092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=G0vOe7//NC/xiSLCcygTToFZTXDKzUUFPzmBzmz8TQFGbDXCwIbWn422iSoEcMgo9t
         CQ4Ri9N3YZPK23VqT/YP/gYwObYssnVKr7LcyAlGZh/KcwfQfrKcrkYw/rpMkGoLkO99
         hcoog1ZMLjaza5SpNUS5b+II9c1KVf6Jc3q1Bm+YsbiBhvKVpAeV7ZCQu5KTxKOCnkII
         xeAscRtvHOwkGQEul3ql00tM0SH3msAQRy0cpAU/XPLuFHBxBiLjmcN2ycqXp2kflU/D
         0lLgf5PK2Vfswjjppy2j1jIl9rtuMTtkfKJaUk9nKX0LeV4b17j9dMSPUA4dkWHAU41j
         DABQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY6m6CK4ALGz0DkZV7GnKtkROOlkSi3P5FI48paC2+a+Qubr9O1QlqSMdtCgCpFWchOqjXfq40YSiC@vger.kernel.org
X-Gm-Message-State: AFq9FYKgMyHTLUxC3ybotCIx9E2Kxlrb/cyJYW4/vDdqi/7h32y/vreb
	v2lda2FFRxsTg05jnMN/5KGoAcZKqBc02WDqu4sSd5NV3M1WM/RUoZPl4lfV1ygL7H/Hejm/2FI
	BUWp6tuUzhoOa8cy9fCWlycKgJe8n9Y0+RzTwszZoX5i50GYSYNdmKNOUeCw6py4N7qCMS7tmkU
	+QwZvN3mcyjWku73GSskzn4nNelS4gDD9+53Slecw=
X-Gm-Gg: AYBFou3V0EC3wzsGe+s1y54xR3qt6KLGCux1gkU+ip0/QUMwl80s5Pi8qdmpsPUZhnh
	gNzyeAMgLM9K+ub8SfOT5wKBYJy6FqGsZ+dDhcvSY8zb2hfI4iGt0bN9/oOI80acRWl3r5NQdeM
	j442UZFxj9nMbqya6Rd+VpByO5P84/NZGBERurzdsukmGNcFpHvC31UWs0d+s=
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-6741cc07025mr2873101d50.10.1790574292195;
        Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-6741cc07025mr2873087d50.10.1790574291796; Sun, 27 Sep 2026
 22:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com> <arObexxuRRmQ5qqw@sirena.co.uk>
In-Reply-To: <arObexxuRRmQ5qqw@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:14:41 +0530
X-Gm-Features: AclHuK8wlZTyoF8oTJGu3l_EQgkbegRC3BqnooxmGUCthXkptRkdIGPllML5mPo
Message-ID: <CAC-tS8CpbnvV28AtziXzOd9CTCwN8ToM5JqFXPRn-4h3=GAGog@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
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
X-Proofpoint-GUID: vaeIL3FOH7HgGBjtpADNurvBQ2liwKbu
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab9fed4 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6K1A5ce8U_YVOHI9IiYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: vaeIL3FOH7HgGBjtpADNurvBQ2liwKbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX0OvkDdQX+tXl
 cDacEnbou/U2AbBtRAaEX6nEf2VNZ6AmDCD/j/0GVW5m3Cpap3ZsGa1bd0hjwEJ/Gmm5q/Guby1
 LPwlw/t3U9aIcCJQkwoG9jvYhjagdhthtAEbbuOEcUi5aSiTAC+g0h0sk/q2jPFKErEjmYCeuap
 THW+cLZYFW0sUPSJ2/TFNF5VqJo71oLTAHBrxnIfq9dVk90Vx9sM0beHCATg1vEdGDmI/PJ+H5C
 go/004rM/iecFX9wma6jWGxhFx/8ft1wUF4Nzne7vLAP87NUzCXFZnDl6pOqJWfxhl9HF1qaa7M
 vjUpi07SmC7sP02cluG5km69YrS3JaGUJQW1IzRYp1+UH9WiolVeyMGm7Wy6bXD2ehi31NnhnBH
 nQRhY57Zr/i+PJSGOh73Zlv7Zjt5oGspOe7YIqcdS7gVyAj/t+9tyIU4nozGHCxdwE0GXx/Pxg7
 mbvkz1SgiRdsKivuRPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX9PcAcIFQ23oh
 tHhY6dxzbdPlZoaUjvRUTMH93YU5mPVz36Smp5ekIifysxWKhWJjOlF/zJRJ+KD0dGtkce5mtlj
 NrcEyeVVJIn5LsKvInAYJ5BX/hxSXeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280022

On Wed, Sep 23, 2026 at 2:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:20PM +0530, Harendra Gautam wrote:
>
> > base-commit: 46e864b539a2d2f6c0e5d08623654513ee50c556
> > change-id: 20260907-b4-qaif-shikra-audio-729007ceff72
> > prerequisite-message-id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e4=
5@oss.qualcomm.com>
> > prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> > prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> > prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
>
> So, this does actually apply independently but does have the
> dependencies above.  I have repeatedtly asked Qualcomm in general to
> please stop sending things with in flight dependencies, it makes things
> very hard to manage.
Thanks for your input, Raised with dependency to avoid any compilation
error. I see that the dependent change is merged, and will raise the
next version without prerequisite or dependencies.
-Harendra
