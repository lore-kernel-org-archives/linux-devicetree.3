Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0882F1FEF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376478; cv=pass; b=QbZtYhC+bTc5Cl+EmExbvri2n/AlV90UQg5PozB4pN1q+nhnojWQJ7pE4OruYH7771ZR9uAW2cRNpmcatp1L+XEeC/X3829qbv7SqkDM3x8rDglVbyQISv++icEQFhoeqo9K1m/sy4Q3LSp58tCYH/ind3MR+VOY5Pj96pfjMAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376478; c=relaxed/simple;
	bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=het3t6cOwACO9PxjsIwypZOf9hxGuwqmY7F+s7GrVTAw61Dcb3C/qKkfFTv909PBZEVrcsZWvH1BcmfVkvKF6kTmiLSfQak5bAzeK6pYivxRaLBvLpFwzSlci9ay+lD406UxjjTihDmT/QDEnbKZ9GIuWw6SrS1NcnoMiMaqHUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQVz4BFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfFNbewc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQVz4BFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfFNbewc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3wcG3275204
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=; b=jQVz4BFZpNUbhzjD
	OvQje9QZrZqkjOyy6WeWu0C+cuu3YORqh2mzv/LsUXJzHECzFBZgA04NdVSPcTjJ
	GtsmU7o84uuiNPVKV8fz0vVA6ihK8HoezmLfodwxb73Jhd7VGaOnahIqx0kBFrIn
	il6zi0r/Yk0Genz32ElVVLBlvW3i8D+o7AQLUFrzjuh6vbJ80LP3/7Imf5mC137w
	PGKUHi0j9vEInenqaK9ZEMlQRzo4dSjXKClTQldlckXulqp693yH9xbLqpX3JSQL
	5cbHfc+Va2x4TzQt42ssjmmZ4UkUbd8rm8zydJzkRw306s/PYjdpdYv+q84S1kdU
	7893Ig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgakt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:41:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so168405086d6.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777376475; cv=none;
        d=google.com; s=arc-20240605;
        b=jAe6Unk9OUaf33rn6U5NMjyycAhZpVsH9kWlID1zUY6r9LSfRNkRLZKlG9PCMIh7pY
         +dNqIH+vQOWA2EQ//oZf3J8EzEiomY9VBqrwNg2PzanIJBujels/n3gXLlewakM/TMl1
         vIDojkO4hOohZGCTTxVnHD9BWxFLegiaNHISSndnsX++H+Qm79+Fan86yG7hB92xzB/b
         wGFdZuYZFcW0Zv596TDbgaEC9xgMhmumYhK0VzXuivAM/Q8mR8FKi31Jm9t4Z6bcStLw
         Sb0e5jKAoVcBvNHKMj6RQ5uwAPWUrnXtoxlXDx6sp4Z81JvjyQbOY8o4N/kS2nl4vb8h
         IZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        fh=b+lsAv5YZPT+RjHCp7+12NpTdxE65Z6sw+6VhuUb+fs=;
        b=HLpiS9Lk4kj+e+y4exr34sH/2UWSOkcjYbXwlthjFPynctJGKOCAw0996S+j4WEOxC
         +lTD2u6sno8zgqdixMnFY3X2tBcaKmm0ouSljyztcARLWQT0SP6RAdvSy6bUjsDdPyTW
         UDf+iJCx3AFcvjjYPnx5WLAowWaHmltMgrGy2FJkkocVAd+A6yxvOS08ju9F3pVmPlcS
         6zBFWRj3c6XhpgX8SQckkz0eUj5uhKncfWn7vG7gW0JeVXCHhI/KOSRSCRJ8L0CA9iwL
         efb/Lvn1FLwMvLJts1ed4EokLVneIxiZZ6N5NyqrRHYP+QDNTNq3v3z92pNYCcwwK63D
         lDzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376475; x=1777981275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=LfFNbewcLWl3JujrYcatutEczwGW80liCpCzAigkqKXneeOBgqiovXJghdbbCPdsas
         YqXSGppK4TouqK26Lso1bO9t6c2yYTt9945dCWZxp9ps46nyIMuuz2xwRwLbD2+lyRUk
         gw204McufDHYBMKSOpV3bhE3LtJe9rVL/zAW+J140zwltNQnxtCK8vQlBK2v8ZpNeXSv
         nPpGI2i4pByWavnV1fWrNG1hr/f+0duLu5Rxyv+hambheoNRJT76pdopX9OW7p3DDUfI
         NZKTOC6ekfxjQvX+K6F6WkDQsg7Lky7A/F7AIySi3E95fbjXa2F/dw9oLQsIUvwxAB1O
         M/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376475; x=1777981275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=gAYS1vl2PNMDw5uZXHMWCNuDZbbSkprmjSprEnBTxTkWL2ju5EPw0F4Zk0vXaAt2NV
         kLNX8aplmoEvfrBJDAKc2uQVII/UfyPYxbnVJJf/ncEtgjxqulRolrG5gC+i+9KK4Gpu
         pAF+uGbeKOfrWGYTBuoQ4aKyxqoicIX4n6yfD/gdtphGp+BHQ6s2dlCbCSSSzL5TODoM
         D2/PrskiD/JgGR+C/NpqFxGkJHt9vCXx5jIf14UH90/h4DCU/TqxHnwfbnErybHK5avu
         AKI+Hd61PU3TtNjSE+FOz/GxciwfLi+WxzVqpHNjky9NCH2bOxM+rxCTPUWI4J9LYsQD
         Wo5g==
X-Forwarded-Encrypted: i=1; AFNElJ8K5hV676PhfvekWyCB/A2b/ZKJroZBa8GUOPpKHwtXa4ZfFukutGLUIjtvGNQ3tL3154lPTkTfZ+6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0FbaLWV7jmVmtxagNgAsveRCwF3i8Bm1AuUgYO5a6yyvWd8f
	Db3gzUpFJzdT25RnjNL9jQe4vK4XaLXXUdF28yE9OawQp7daS3TPfz7kfdSCzyhLiU4D32GcLZl
	BLgvlvZvlh90tlR6kTCKT/06eUNEUYJ5A5THMvN1yhfqogORn1fpV73hhhdaCeb6NKcv9uEv+6O
	rXJ7wACzEDoscqZ9I4q60vhRxWWjQq7sLtZYZX1lQ=
X-Gm-Gg: AeBDievwga+8gQcLTxN0XN4OXBlxW1xTF371TELQFvmKmWTJjGXF2xDC4dUO8que1n9
	RBrHy+NfhzV3q0UErGAMePIc8GCiDuIgbVdv5LNV14PJ/h7LWWZK7aTs4bvKbBM11qn7zDWxIP9
	Ia+cEJA5nb9MAB/ENVnXGX+OWAM4KRy0yQTAT9voLSyETlHi5BQEi4V968q+vzrLrVySikCeSIL
	FiazZT5/SzzLd5sE3YFh9r0sWdT4h1FbriChOxYls9jgWA39Q==
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id 6a1803df08f44-8b3e31b26bcmr42646696d6.46.1777376475305;
        Tue, 28 Apr 2026 04:41:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id
 6a1803df08f44-8b3e31b26bcmr42646256d6.46.1777376474849; Tue, 28 Apr 2026
 04:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-1-f430e7485009@oss.qualcomm.com> <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
In-Reply-To: <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:41:04 +0200
X-Gm-Features: AVHnY4I30PHO3JaiGQw02eVXNc-m3WyF_MeHdddg6z1v0u-m38ixLGWueeKRES0
Message-ID: <CAFEp6-3Cx_6xa0e452220wfvUwcQvwEy6vtnBnwTpqTvC+HptQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] media: qcom: camss: Add support to populate sub-devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfX1d5GYLMB7ukm
 Afm2cuoiyeoDZpc0pvlbXyzUJyawmQHknTRO0pGJ6BIs+pCr0hDcTpdx7QbtczNMK0g5sInNyop
 RkJ6p+XFncLfHlaQr3leWWY4OIIwjkSRRVJOXc+pNlw3e3p3ml4DW1sdvq1uUaQQxdAOwLRaLsp
 FOR+0nvMQ/MU20+P88JQKVS5ZKuKfsrdAsSiTHi7YHwI1HOT/fTORjte+ZGzqub+PiH1Sx6AQ2p
 eYMErO2tJUWwgOVTl6KvRt3Os7Rm9LQNcoWbM6PnUm9D1S26HyhLN0bmGsgfN1CNrO/z4kXuU/4
 cJb3KiZClO7Kwf3R4Y9dRi/Vov3Iie33Pgz+pfO6D/gL+Sa3Qy8GNCU0mCgJuIyrE7/iCwSlWwp
 vkaXiX5WiQnmgjp4c4qXn51PeVsIHXY0Ty7XD5bTS4c1DjvNi3S/W/ImWDQQfUg64musPqId86j
 IenreDd4hFZZmpWmeIg==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f09cdc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Q8RtUPtQJvjqpABxVQUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sde8owW9iS_r3scE6MTggl5hihpTJBkD
X-Proofpoint-ORIG-GUID: sde8owW9iS_r3scE6MTggl5hihpTJBkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280107

On Tue, Apr 28, 2026 at 8:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/04/2026 14:43, Loic Poulain wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> There are no children in DTS and ABI does not allow them, so this is not
> really correct or you just missed proper order - bindings describing the
> ABI changes should be always before the actual change implementing it.

Right, this is a dependency that I cherry-picked from a previous
Bryan=E2=80=99s series. I will make sure to place it correctly, or explicit=
ly
document the series dependency in the next revision.
