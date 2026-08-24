Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B63A6418
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559782; cv=none; b=ISgPF2QFkW74gasrjJcAAkXhshqeGBrJFF5FJeop5Kx8RhXHnFVqRzJsKoH4nVa8rDSpN4naIEdYfThq8QFb5ewdbnMpObSntpyCQdZhpVIsAqx5xLhCdP/29yZL1bzrxaKrN+reO5YYvUIcwC6+UYH8Fa7XVJpw8ChqZBYLs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559782; c=relaxed/simple;
	bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liqjJpY+GgnMhrU5Beu5SUwfLzfYQp/WYCeYAwP+GItSnCzmPOnZsVFbdkw/zB/8sHuV3u05Rqpzq52l6IorTlv+JdHg/g4IBHiCfATLZpiv/BEBSXoo/lLNpcFg2antLcX0ewyB24zYIrrvkFsxkfTZl12JxSTNwjcIht+vQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O51hXF6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONPpbNrq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O51hXF6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONPpbNrq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7PvpU2666074
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rfclZYf7Uzx4bu/Ox2iIC+60
	XIG9HV2XUwYmcsvUYYM=; b=O51hXF6Y7PmN4YnhSBtH22N17WGEzBzVJgjos4UE
	LkzESPN90baTSC1WztVz+Jh4B3YvIf2yPsCqnUyqUla/FB6z6i+JWKtIH5Uo9DAM
	JerXzsx7O1Wi4UTqYQzkeQN1RK87hNaeddlnSBjW7u/Ripd7Ch2xeyuwXBXLjljH
	JOKw6hl+m3Nf7xwPkjXt11oQiPqdo+Ig/nxwj0buEdsr82ZQrxoD/ZxPeiiT8D7h
	ZvBddJAV62fCt1kSmJ7cFI0hm+sWUfh1RUyO0F0O+cSVOLDSitdTfIa6GdhdDCPP
	68uowQRgQvppEBfkmNnqdkrxOyhxnynhtGsQeJNA/Em8nw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr7ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:22:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c3607c924so3965864241.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559779; x=1788164579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
        b=ONPpbNrqfgr7+lfg8Zx5+14FufSgVc/xyFc35MaiQVV6M0mlJiwF7ghwnCd4xyqOB8
         jKHgPDsaiOZicOaZ4Qcd00uNUJujCEJ8KvnJv2zF4JzgVjI5KFOmORJtj3qTzbWuheH/
         f3aGQlRrMCu01Ej9fS5R3yA3qmXcnNDJwx1tFi7CYeevJwArloK1BCiCfPPXLVBaUJrm
         E9bWegmNTgrXFcE0a2hVlkc2GNN40fBtxS2X17QJq0vUI85NwgkVcYUqvyh+0eWk6b9a
         QxE35N8JbGO/A0SWvwEb/jmTEIUFLpmQOvYKhouska+2Cc8YPPdwqrMQT4nPXy5iS1uR
         Vvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559779; x=1788164579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
        b=Ohpou/Gkl1qHjaWQrgT6IdrZJcoyOAaRTQXUUJOAgwV0pEi4Pj0KobCtOT4d9IDnCb
         vg0RcRbj0FC/Kk3fr4SRH1iZAWVoLTKrHo9nqwiEtodSM2FG47d8qLESjQB0TRhC+Xaj
         XcPRqgjgqje17TKe25JGMk04d8/T3U0gPB0X4sl6OyiaHfH/8W2OCrXluBc10vo3nwK2
         qL1Uch0IpIWP+Ies4v3gTiH/Fhthdy5pi5nR99GX9Vq3gImP1tAcX5ousc/QjhNLbqOB
         8Lnz0vkigF11+b8zZI4dLrR16qsczmRbMqoSN7mvtA4AkfvLaU95KXk9ECUuuag16u0g
         fgJA==
X-Forwarded-Encrypted: i=1; AHgh+RqzVdVfIKy3tgXfwuK/kSMDQadrEF1ug4Q4cBZwsWDT49dAezEvqPlAMuB/xb7LBEuRxDh520Z7erHB@vger.kernel.org
X-Gm-Message-State: AFuF++mcmlEWoLsQ91eY2YfRbDH7QUpQalNtrsfST+FiEYM0AKaRDUZA
	vkNMJoLh5UijXis1AZX0vx8DZ776cBbP+JE46vV7rco8FRknv4m8BCh+l9EFjkVBJ7OjQ+/Q6Sr
	hRR+cPWl9flZBbzm6+cUit+/1VUME0cWQpvW8ZiC9iQvwPCnBiUwFflXiZujCDx7B
X-Gm-Gg: AR+sD10BboYK94u+9J/EqQq5bgs3LnVxsVpbFuIY9gGgDrHD8yNt84z5HnhsbYD9apj
	HzqIrFbBzGOGx/XX3iW33EUjzGIDG0UrjdjMIQc2T4EYVS8tErWkhcZ88ANx6fKN9BOyBWSMWdn
	LmzHq6SsgNOqQEqKrxjjYz2u4vWX2bt+4Rja+xXCd85OLNOfUVY5E/+etJHdrR6aJJW+2s1YBNy
	Z47DoIoQZwboiDvr/zHez2g3vKBYQdHIT4wAEvkX37b7wojMooeQ6BU1XJxhn6vLhbl20KPpEMz
	ukNENs/INGqCG0eYNLexfWjeskZ4bIyQHyWy0iR7lKdUuKxndnivZ6+SYeIJY92vePuX4WwbZz1
	/J+7g+oMBhJOXmAc=
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id ada2fe7eead31-778f2cd6323mr5698359137.13.1787559779099;
        Mon, 24 Aug 2026 01:22:59 -0700 (PDT)
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id ada2fe7eead31-778f2cd6323mr5698338137.13.1787559778563;
        Mon, 24 Aug 2026 01:22:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1aeab9sm8341362a12.22.2026.08.24.01.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:22:57 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
Message-ID: <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MyBTYWx0ZWRfXwSaYU/CNHZ+L
 luI72ZAgfaaJI3Aqrty9D+AdXAb6XA5hOAv0fUIlhbmxN+RN5RDt9bSvf4xdPI3mYdkOLBYQhDD
 RXicnaIHk0WvaJFJxrXJJQgSoKa83w4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MyBTYWx0ZWRfX/cGrXHrHHxbC
 87HP6pb8yheA5zleWcxdb8wx7edTlwqWdDMT+hGzsqJhc53D4M73pSfrKWLzFzhBiPSjEUybxII
 Zq5fUpEqZNixicDA6gtVJY/9KArH3uwEgKbPxe+MqpQgobRAcPmYf8ESxLYaOzjJeMZ96rC8egC
 Qy2ADSABFZb18Cz9EJD0rNRdjPdwX0Cw/sh563NhL1IM9hxX90eikH8KYouRoESuJerYBhH7Mbf
 mku0c5pbpzb9lqtVdci4HLMoPGi2wKTP6LHB95O78kIg7NYU9PwxRTAyF0KIDhFU7Emfv3Its00
 GvFZxUx70uu0U9fdeO7yEATxQKTPIModJ0RH4GsKGl+Y8SQv7MPO0mq2k/8LZWpsQk3wCAUILIM
 htGdM4WS3ew6ux3Zs/GKrcdgnpWlWbZapl5lNEQutMSeAJcr93EJyVV7FJgm5whY6smLxp/qG/p
 mJZoBCM4NiBZlvAb2cA==
X-Proofpoint-ORIG-GUID: qwXD2MO1X5iwMUvZZlZdFxdmOWNs6GNB
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8bff63 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eKVyUmMguRHMKu-RSS8A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: qwXD2MO1X5iwMUvZZlZdFxdmOWNs6GNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240073

On 26-08-24 12:06:27, Harendra Gautam wrote:
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

Commit message missing.
