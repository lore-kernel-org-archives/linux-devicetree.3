Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437124;
	b=xCaHCQ9Mj3OjftNdqD7raZOY8wNPXilDD4EjaEULlfIjkd+oR/tXue5X46kv7GbBh0aa
	 Q9gZLTNovMuV143Jzd3z0ljOTdVz5VN89vKEL+Ji8Xah2u09xLR/u+TdiE3wWx004eAg3
	 gQobLDwPT+dDf3UCCMqM5+ua6O9/2bou8tAPrtPVsnBhfAl0hjOYlVj4vk+1MKh7eGtxr
	 of02kFpEJnZ8zMuszCc/O/LecnV6nwmQyAiVNhzDPCcreekyqXdbWsCRRwIH1e+x5zzHH
	 tC1Z0BLiYLHp5AY7yDFWs2SjMj1DlK4d7j0fh06Sx+ZPEhVAKsNAEQhblnM7PiJ+kqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
	b=0l4IHNXkVeJcgRyuxGuwGshLLWy9ZsCIxBdUVpAnBQcAbSMlcTZvhaFiYZ47ejnjfilc
	 kMD3Om5MpzZbhFvFmMGxMOHAAU40+zleZx9AxBb3EdY5Mc5hcpCl9wX/Tuye3h0omx9zn
	 xDbGz8XwsgiXp3UCHCd8avSHR8lAzmLBb1SP+DuF+uMo8b69sU3/jSUB90jdRXsvjLQKK
	 S06fQWuZK7JGputzu+J1ileuYlUQ031REDWS7Dq74s8D+/OF9hM9GyrEzFxMOVdEcfA7t
	 js6xiQVnaIHu7N7F2ZkMO3MHi28IeNBmkqJLgWqZrpfyeBzS8T5H/QTVRFZZe9jyBjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC8A606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4dlas3760976
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnWUCT0nP14ewlYiMnjRm7mx
	k446HBoHRdssfYe4its=; b=A546CuQbdAMLXraN1TIUHIC3ExCyLGnsvQ0lgo2K
	nu1eXR4leaDysTFV8YtULKq/MsfXDpBVUgnXfwmf6csQSB8HwaBoJcWVA1954q9z
	Pb5UbN7tlZpl9tHJIdGx2WlAyeBswUD3CyrAgCdlR7Yzc4eGKVZYQPHSJuYFzvaq
	0UqGdjk9o5lTtiXeM79EA0EirU9dNQb2fRTVHEPdwu3nAvqN/Y+1Mhkm/CU1d4U1
	UaKILiwd7Kkr5VsUW6YCK30UfjiQeABRAUslqxXx76DKApGxgrl/C9vStx0fEw0a
	fQbbDZkyrJR5v8UpQLiqGT0iqzQlJGZah7a6Q1kjUEm6wg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0j4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:58:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a190c53a3so1984141eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437122; x=1794041922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=NtOMQSPdjV09qjwqpUf1aOreafMFrYY70hp+E0jFoZVj9p/U66GjVxocQVBBYYtfW+
         s+WrciXUFDV90qoyzUL2u5WIpKR1nvyA9p113fer3AtcFWuJ5t3IwmI6SNk+fL5X2wdW
         ULVCR+y9GS3tyZMIoV6AKH6zxQnWe7y9CrhSpNJrgoZGe42DN7KKkHb6xV3FrD5k20Y2
         GmHC10wYf/VN07VZIcPwoP0/Uj+k3JnuhllAdyVKBf2PlXCtLWmgAjhXkbLPO+B3MER7
         CgPSWPvHikDUHtJIojGvaz8uhA3U4OmQZbL9rFRBZDATB2vXYno7ywgmJTXNRKi7pJxB
         c9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437122; x=1794041922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=aVxkhO7s1uh+p+MaLn6Vxvss7GQcBK6RC8T3OXhNyuIslHa2MII+AbUaeXlH7VlrXZ
         AyWlYrjXyIbik6CdZSPzTQ5eCcBrSomtSq3FzHdDrUWxytnbrDwcMLH/pFf7pvKEH6Vl
         zQu3DPrizd/DCl5n/9P1B6ntiuCVf0Nm7G7b7tbLtNeURqB2wKXCDb4EMNhUbWaWDbZW
         SQvgpTUmSxc9CktFuzqaTdtrT/+GCIMmpn/txlDBfd038vj6MoJlHlvS/4K5xx9NI6dO
         B1mUdmYWZESYS5oV3Q13V+xdmE2vX6OqSIKITEgiebOLYMoecravVa/s51ip5NiMTgBz
         Fxsw==
X-Forwarded-Encrypted: i=1; AKwUvBwrh15X2jwqueRAFyiTXHdvVD5ouXz/SBiI3yPuVoPkVgJiUFLQzbjp7f1dVkDtkMyfh7VDnhNuQUIR@vger.kernel.org
X-Gm-Message-State: AFq9FYKEbgRurESTTJZtQ6T4tu/30fyivB03GP1oaj04hREW5RRz2wN0
	pPvkla3aVJiN8/2Wirrz3GVBod5VBZ6OK+l4D4j4t80kOPooewOR7NkUfF8Lt8Pt3X6hWXRXREJ
	iQQYXu/D3TSeTWtPp/Xy2VUiFAUJIeYHiiLxc1+NePY2yK+iCQsmJrPFRIJzvDKMn
X-Gm-Gg: AYBFou1EoTl5Hvlyi/3p3WwvZmtkuCkq7lJb61ax4UGJyHvEFDR2sJTMJ5fI6+YhXVz
	GbnoPda2966eKre2b47pzQ6VGyRMkB8l7RMvEjd8fC8rl612Ar9YtMw+vg21Sql3Mxam5Nn0Tqi
	M8uBRG8hd6oENYDu836yVbp7mLrof6rTVovvLlmRAjkLWNxgCtwdBl+ltpAZVpz4FPnTRmv7KNS
	sQxfu7ivSOVlKnRTwq/w7cCunJazWLI5cPg31INMZ4ruP1uss+8iaCeUhk+BGl3ypQaRwzOcKoA
	4u/XIHB/vCqFxAV0LtBA8/rb+Oyk3BlyabVdalW6V28R1tlA9mMLpk28wE955bRupHbzdtVFzSA
	VwWMnKYGap/TDHxLnTdYcnaLoivzycW2qTjYsysC4nuY3A47xNV9wMxzacYfWiuKWncO+213wKD
	DXHwhUmzRE7IGLShA=
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795475eec.4.1793437122133;
        Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795451eec.4.1793437121608;
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm14503095eec.19.2026.10.31.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:58:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <auWtvHZyuJz-Cvjm@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
 <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
X-Proofpoint-GUID: K9z6M2en1W8-e2S4inFgFa1Wq3LiVe3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXycQFKZnyUqDx
 ENcFlF8VD7AXeFWfjANBnOwQOMf8BFQKXcpR4wijgHZVOvoFX84ey8QS/0qUM60wWajJDjiQF7V
 cbmkLKlhCA10CqoBYhfIffyGyNxbMRE4inU+y3SxWcEYDk1FfKmkxqX5eGmGxezO3L4GUj7BdY0
 pDllZG6AP2OFTUGzcq95FNfwQodwYmSZD1sr7lAkSHW/ow1kayG79AsbDG5bg9kojz3sGw4K7a+
 gbheJ/kLqrQ5/mpgoCEIulBTKpKGhzU6y04vYGyhXgHbkGFu2aLfCRgfycqYHiTQC+bxjL1iJ0+
 CDM+QE2jkFscrciRCp7WoMgKcGxM/q61DsdRWNvYiQQkGTfUM3KuXVwhAhc7Dqnoau/IZSgkI7y
 yeUE/OqOiBind2jPeMcmmynZw/X6ZX40qfac6XOJiMiF4n9W32wAdmjA/+cfSP92H65GZ0UTeJy
 bdPRRh4fopUdICC5w3Q==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5adc2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h7ndaOTxZN1f3CytN_wA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXzzAaph36u4PO
 2S/pZvixlrjHun6kDUgCAzU7a8M5m85WNtuLW4QFB76ALrH1Ddhf9l3LtCEUIYApoO5n78vLwEO
 3f5OYBLX1BdgI46zbLbNDKuGRaiZBOY=
X-Proofpoint-ORIG-GUID: K9z6M2en1W8-e2S4inFgFa1Wq3LiVe3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 03:12:45PM +0300, Abel Vesa wrote:
> On 26-10-15 10:37:08, Shawn Guo wrote:
> > Add label for firmware and reserved-memory node to make it easier for user
> > to override the default configuration.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> This could've been part of patch 5. In any case:

Ok, I will squash it in v3.

> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

Shawn
