Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63643747C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146026; cv=pass; b=ANDAbX+PzgstJnxcQRPQKxgReFr22Ja/Ur49diVA/BfxAxFW28zCIh7257Y+EtO5/lVmYSQ3I9oLGoKwhCKeKzAUxMjAOlU3UClj+s9dlmKGZ9jHtpWt/uuxvKD6/7MYESbvLVnnbRlBvlGg/apjMVjUGqT3Vtg6J5RwR9sSdX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146026; c=relaxed/simple;
	bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5nd0jZWEdd6YC4zohsuiyfxj+zivaM8yEAnN2gEvV8znZz2HPMDSQHE3jzSnObQxOhRDj3FadvWwWMMccvkcysZb+jv1YnCnSsj4DkCyycNTgdEAjm6NGpVAYHdVnjpjVxoXbAoZ9HeTXM6GHXC7ne/SRnwSef9V7rGQzR4lr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0NI+ZSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu7617uo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0NI+ZSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu7617uo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iRYV2571441
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cd+UFMshbHHucxt9icv2dTeV
	fo16suRl9lwtg+OQtVI=; b=L0NI+ZSJlV3Fd2XeEnpmo5NEe25PmSIOXXdpkttX
	IVOndk1jMctIIuvuK1SG1T2sDsJos7ZGj3mmMSlPNsCLZW/LZQlFQdTn7ySN3kO/
	B7xnRuauL9/BvkQgzsM2HnCcLbD0IahICZKJuBikHWiHzWo4N+p2AXRy8nKUHJYY
	+K5lRjvKzhb+gsphYWl7poiskWTxYq13PhH0XmJpT1RRXgKk4SEUhYWUDaxCZbew
	64zvE/tWlrTz9wlj1eDBp8XkvVsPiXA4Nv0GlKMvUOmOfej5PoHda74iJ5P/nwTg
	rOV4itroE9Yp2Bxx3t89ZIW3itiZSEhuZ3QMJR4nVNmhVg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux862yqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81eddfe28b4so15340117b3.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790146015; cv=none;
        d=google.com; s=arc-20260327;
        b=YWCmFMKB2MPR9t2N9iwUJviaQZ/Tw/QuiNx5Nq/1CpbjkF+v6uEWDZKVTSuPivnaej
         CLLKGEgtXUs7/b8Phe6mAG3ZmMC/CHezwCVz5WoMExIHp1qnmqHFd5zrchncpJJ3PuoI
         C0xylIS+ptinLsNNG2qRJNElmZqEZtkKM5jBnap0ZcuQeWaqAKbM5yNYE9jq/cke1wlf
         D+d/JuuZMP+eWI1RWM06nDtA1lRaqspr4cm26ah+8JIwAyOLAOI1Lpc8XGVtDJSjnu3v
         aNh92zHq9eJHEChbXjOGkgbIjpBQ6HJLm4fCKlkVVsB0iq2Regnpw5HQG2kwSR9LS7Ou
         6eFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        fh=w3KQyXWtIwE04wYbwq+exjLIZnPL7GCPg5Synu2YRjM=;
        b=RwziiGftX6fO15IIY2vu4zEINVC0iljcqqlDcC+rC/cmPXBxYVUK+nxE082OPqeXxk
         U90sK6N1k4S06XKNEPFvc6g4Ki3v1IS6B74tIUMmPCg2J6Ail5pSmqqCoSY0qZGkJuLA
         ZNsL4Ytflep5eIers446Q0uQQPYe47zMW9QJmrafojiNIhZiUzO+feWB8uo93lQkLEyM
         r+qFcFeyRXjMFglS0qXrxYMxTVMju+9iMXYuBM3NrOnDwXSrIBxi5LK3wQwFUQhlXBFH
         nKbd/Rdkryf5TGVK8ooGc1c96zQNBada9/55E/Go27lpDl2xj4RMbGOTOjvp9pa5JSph
         KAyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146015; x=1790750815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=Hu7617uoFzQUVQWB96mh4fqXtX6fplDdYJ9oWJJCwCqwH1aElCs5v4S9h6LXP4tB6m
         g5RQh0hJ5JTurFvE7HKh7aX2XArEvOxO1S7LkElg92rnwjefhAuvMw3/f9YRGh97WIwj
         TP3Ue1Ui2uq7zliRm1ppy7pES2+NttBzmk0jEqDK6q8g6q1IzDDhEly3dPqXu/G9MNJe
         PTHCvjhk1UjpEUWIqAampIcHrrOaUJOzfzaSmP8VcFS5RaOkE7o9pSaabKl/F9rEaXMV
         KJcnIZBMaHqVHaUIxrJPcNkvEvznZbxOLZli7WF7LWMRQlZ5fPMEuWOvIiscObpzV66k
         u6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146015; x=1790750815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=V04JsWkUbMEhrykif8yY3zhYPikIvCFqUdan3YwB9VPqrHiajBfl2lU2cMZbrkyz2V
         KGF0dOez5uHNY1x1gkvooKAmy0r+hIz7tY6EHdXi60ln5yTTuIY29so2FQsvQlxzAgG9
         IOgjpw2YgLXIFcmC14nNFHEg7Mxk0Ceo2IkXLH6LaElcdzgREJ5qyjB86kdUF9gpy1Q0
         FT+zeeJbp1dhzYAjxFXa9tOLVJbhE2qud3oUgJwgpvKKNAgqPyq/Zq9pPaQC0ZyLFmCp
         saW9EW2qxIBS1NWI8ICKt+nA/1nnjBaGCOi9/HB3CA3HxNj4BspWz8+vwj5+B+FKH2K2
         1DXA==
X-Forwarded-Encrypted: i=1; AKwUvBxzj7uM6Ktzgi+NEr+lXNg7zCFI5bmfEnbUzBUdFrxb8QFwnE1YPB1j0S4h6LRFjyhAqj7e4hn8RvAU@vger.kernel.org
X-Gm-Message-State: AFuF++nkb120GknHkyDf9J8M+EgabFd1pDwoMBFXbxCJR0oE5JA/Kf0+
	vwpgbX6GN2PRsSF38G8/QLY+kjj2b16k7cw5lwlTdM1jBgKhDQ4XQSlrZ/JoU0zzyOt+3VvzAM2
	Ft21c+SubfoEjZLgGJ5gtLJHQpMTF6l2IcVhN1hi4FvcdToEHgOmwWqwLjWwt4bZ2b20h5WZlH8
	L4+HQtWNkVLn8qL+GzdWVtXgZJj4JBJZrUyQ3mOHQ=
X-Gm-Gg: AYBFou0ld5CFlT9xf2MkU+t30HukgYgT3dSKadEu1x8imFxoYRTXuvMpWjhSaPIdugB
	WAdbg8OwcfMU2MXVupgKJLZLoh9DsuSdsQxOuZwcFZfek1Xh5FM7Gpd8+WduCd269rzZwm/E6D2
	XzZ3wspZAGC/dyBDUWeilLfMaBNOiPvcMpacuUSs89Qo3yAwXYvM9CYZ7oAA==
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id 00721157ae682-8a45afa5e61mr11724777b3.42.1790146015213;
        Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id
 00721157ae682-8a45afa5e61mr11724697b3.42.1790146014877; Tue, 22 Sep 2026
 23:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com> <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
In-Reply-To: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:16:44 +0530
X-Gm-Features: AclHuK8RmfarfYcyic1FK0k471Xfoy9CjVOJ3A0odhXQDN9UmnemC72i7Itidw0
Message-ID: <CAC-tS8DO3SpVLapNr-VVVQdqQgNMmd8oX0Fizg=sqSs-iNQ2nw@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
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
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ysDP5F7OREc_oCsiALkX4mhGqDOO3sYg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX4DTCM72Wrody
 bhLQpSL6Q6+DV7d42IN+Lt4+GUqucGm4IHYa0jg7eEBp7d5G3o0sW5xEsWOSg9AX0WPlYZ9mwrP
 1KY4WU+/TKOm1oZHaj/ghGIU7TfYvKU=
X-Proofpoint-ORIG-GUID: ysDP5F7OREc_oCsiALkX4mhGqDOO3sYg
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab375df cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U4cKQ1tlMYw-BQMU8JwA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX0dgqIywUuN9o
 R9cqIYJLqD6v3I6ErCkYDpbTYWpNNi7v8TQKPFxInEgqRGvDv+ewctKBxpJ59Fl0LdFNDDGCsyf
 gjd5gYBPu3hWO8OQxb43Bk5Dqrb/tuxRaLiMYRJ6ZfBg1vXc7BKLRRzb/jqq/gN9FoGm3tuK5vk
 I4xNXRgO7YZYITZeEE/etNYFZ2K0NIAwRy5RCStMFp5+uQfnDYmnIBi4u8s/qSFQRlMGvqWNFip
 D6N5L95QxkSZv8Fg8ZLOSxIHhK1F6Yb1BD/QUycmUTqEfkDDYsyk/UpS24bludg/BlxOdeDJrk2
 wxvKfsh5YAJ3JM4tjU1uJuryhjFiw1lIDXmdcC8WrApJfyVtfnBbv3CGOrofCqfF9HSvkPbWfgA
 BRiaRBwyGAA0iY4bWr6evMv7BL8XK51UbdHngya5C0qH0ob2UEn68i/Sb+IuwNiJrWLoZFBwFt2
 aUehLAtWDHLCv46qLlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230026

> > header for QAIF DAI and AIF interface IDs.
> > index 3a99703dbc4a..f08c20c84c60 100644
> > --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> > +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>
> Please drop this DAI ID change from this series.
>
> I have posted a separate series for these DAI ID additions since they
> are required by other Qualcomm platforms as well.
>
> https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/
>
> Keeping them separate avoids blocking those board enablements and allows
> this series to remain focused on the Shikra-specific changes.
>
> Best Regards,
> Rafi.
>
Sure. I will be addressing this in the next version.
-Harendra
