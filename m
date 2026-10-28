Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211052;
	b=qmz1CdKmrh4ZzTAA1FoaptWLPGnYftHYNUns4nQ5n6LirXWt9kfr+sP28VGKpt2tA0f6
	 /yfYZINfIOr2ERHHytN68PwDuFPbDn4Tm9KlT7MfKgqqKXq2nSnoozuj7B8NrpCpc/QOf
	 qlTJ9jQBZIX/ZykLMNaiBxeCPGtLEgACjk1DV+ejSr6oumjfqOY7eNtKuAqqHHGEyMh0T
	 gn+AJL6jrHohzv0xp7ZlHtHDK7SjN/BwG9MqGqLADs+22yFF4jKq7V+PFQZpFL83qAkS7
	 ygSUDlXDtH+b6ZPkNWxtGCjU5y352BhodT37auHwdYNILpl7Bmvlg7PQC8+A9bBp06w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
	b=4waikqW0FgkTnHDCYEmvGVLHFDpzwkjeyNAavhfK/dLg60Rbdo8PuEeypALVvrzkKHEY
	 G7TJpOknHSdpkR9BETAMghvdrKlZqieJdzr+oPRuuk3jd2U9b7+ZLzneITUIsTxmyokiD
	 sFG0YKfIO12w1Jmj3tedcqkB+s/D9pj+S0TK1OEMSQ+xwzk/koBKxUJiZ31rA0hpXiUp+
	 ACqntAZ/PL1iG5DYMoPWWguxzCXvNUidg/4vyxPtvswpGi/9duLkIwHvI5vJYaBzUP482
	 bfKByTngG6r10OoTnPbUJM+jyoJYoETCFjmseHltc2u9D5u6LLQYzKu/QfCFu/ElKLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArxIu4Pw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyILZ4yb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50FA60A6F4C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50FA60A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArxIu4Pw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyILZ4yb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB5S62070783
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6u3zqcJQ01s
	SMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=; b=ArxIu4PwtAhxXYrlBnwxbsMSKn9
	Sa9Yu3eWK/NuQ/ZMmyh2bEcFsDg5zgE14xK3YIx/VdViTFPR3PupnD7+J0OoH33e
	piHVmnpn/wgAh27ZLAZOHD2qz3bymru9azMuhO7PU4r9+DZUoxeiMsSlk694qaUC
	QSDaY7qi4Gi7w5Xr24b0cZNDdJOSINYnZTEaLUgSv0aSS229Q7K2rCwC4TzP+btd
	46fuPGkeqY2H+Sw+r/pD55YlUR7rReFFEdb0XldyUsZkAJUGxWzpY0jDP3yphaP7
	TkI3fsZxELPFB05xHviqgvdAVD2dK6kwOYnb/Bd0TJtI8ay8Jv1RJVshkkg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7kn3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:10:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c70349f65so29053316d6.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793211045; x=1793815845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
        b=NyILZ4ybfIWMNXTIxPdmD98k45qlob8L3xmgmoH/y8/bsrzCr4DKiuBKHr0yjtlRYy
         N5UzUTuJeyDhEaP64mTsOyDy3pozCrcFvU15WqH48tOK+3rc8zatPzOqHULHCqVP25JO
         h6PKnNMEnBHUsAlJutFu1k+7chgkPb53HOwNsQl18v6Gdp5DDD73Aswgg5nE4+dCZs65
         0gXopaUm27EGIiwNNFerGiJPn9ZT+C0HXBETmPxewupaNCUut8q4ohOeG7awLpyi8TjZ
         4UQf/v3j0bSeX+tTIMilHex2Zyud4cZLYUAi8TYq/13G4rT8d2lRPGE5WlxaPAYzysXA
         5eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211045; x=1793815845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
        b=JI+KDMfg+FtthIA7UPwssyovkXezfNHTvdAptpUT2dMd9AV6Jji4IG7bT+xOllrGLc
         S1yBnEU9k2Zo0U2Pa//F4h/Iljcoc9Gjaev84DVy3szZsWrV93slBMqOX7wyt5PvL/Dt
         CyAHJgMTMmg4hIyYvIls/kyUt08dhfWL8ttLs+xejPSLdQZKHO0CZ9lfxK+yK04pTp9e
         I1kt03n0Ew7X9sK0s0aGh7wPLsWL8tUy14Wu/Gp0mo4HcMKHNkxGFILuZFL+8mnHfPel
         cndPHm1FgJUHTLFIcjyCV+uuk25fRrCkizzQeAcleB+jYP95TDrW5bLFxRiHYs5OWn2z
         3A2g==
X-Forwarded-Encrypted: i=1; AKwUvBxr2ngkuXOL80aJmMm89317zGrH6iJwmGBMsM3VTWFS05npB6qhqX2iOnN1nVTwwgKaSPLZoBDY9VVT@vger.kernel.org
X-Gm-Message-State: AFq9FYLVc2Hsd0VhR7vjkNg7IjwCNWZ+zE4alIYSHgeZZ0Cl8NL+YrEa
	Lc3DzW97tTz921jvoAcn/lY6ZCk1PENxBntvjGmrekq1kz3G9scjx7r1rBqdk9PHazNUioIICEf
	BaZJP2ePiaeSPS+scu0xgBRcgdgBcg89dxEHb01i9ofp4sCD80Zh9jgGyHyqL1pgy
X-Gm-Gg: AYBFou3Dz0aEEZaFE2R8IT3MmSHwD6v0vbB9jNSF2z3jD4HBF3HxMwGGf0oWJNMO4KU
	Iis9Ixehd5FaoF2qN7odf1ipPlp9rJagLmOYRE5zFc/INUOVZB5wHey9qG7n15mMiFn1JrmzCKm
	bu9iPr9z/7+Jg7ms6oyS+LJyTk5aP59AOGIkt/iudnWgE16EoSsIXpTP5pKF5v5RivTVraXulQ9
	+GvfjiFC9Cgya+obrBWRHN3M80166sfT5KJqjzEGClWTw6206IHxE0/IoSFIuJClYi8WjEYjqCP
	ODRAsakLHAWn2U3cWiSabHSsLBeGh/xrB06Cz0JfrgRZp+yytTGqNeqYoVpBxgyDbZp+n2aj7Wp
	njbw7YouBekx6YR7gOjAd83/1CwKBSz6KyErqrMmYEnCDJH/wPyRupQ7fNIlOHJmSxKYHJ5lSkQ
	==
X-Received: by 2002:a05:620a:6493:b0:93f:2ff0:87ef with SMTP id af79cd13be357-94408a728bamr431339085a.15.1793211044828;
        Wed, 28 Oct 2026 11:10:44 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93f:2ff0:87ef with SMTP id af79cd13be357-94408a728bamr431333885a.15.1793211044276;
        Wed, 28 Oct 2026 11:10:44 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm9801595e9.15.2026.10.28.11.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:10:42 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add interconnect provider
Date: Wed, 28 Oct 2026 20:10:40 +0200
Message-Id: <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com> <20261020-bloodhound-of-remarkable-debate-11afe3@quoll> <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX5ivexLe7Sf/G
 wijPjX14Xz6Aoyw2QhPmy6PyT1F5TipITJpx4jkfC4ztXZl6uEoo9mj4MditOKM54NkCBRwBOOm
 NZ+iarHnFAINFW+HdfiepiPek/oymrc=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae23aa5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SLSU3p2cmSaEdqdVgzYA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: bR58Pxqv95v4CTONW2kjbI5AAWKefB_f
X-Proofpoint-ORIG-GUID: bR58Pxqv95v4CTONW2kjbI5AAWKefB_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX+4YK1ETghR4F
 N1q79xIKn7lDh2piYB/gqmxn/OLQSBsZGwNk9gaAvtZP0GVnyo7GTrQmgrDgdKfiYl7PAtzix8S
 7kDmtA8iK8QhSu3s+Kb6/9DvrWiJws20LAC4eXa0gp2x7/fERzsavn90/Sc6v85GCP2mFJrujl3
 f5H9juJSy9LZ3pCIKwE37ejY0lVu4WKhhjLjGKZUngZae96vSpYhzRAAQaB6LgO8kswB7DkQuC5
 XEYmAxUuk1X+ZZoRy1wSbe2USyBDtj4PxyGReS/jNODJDKrznoRym432mLK62xBuIBNyJ+25nfj
 MN6Lq+l046oPBrwwr2gmB+6vYHY6lbsxozp+dk9Ez4gH6H9qqQiYHXBYUFfK/tOtu+vU4BY/Px3
 m4CzlEUR0BBUgbTvfRjrGunJJ3zLhebCA3+dSq8B4wxIwFRFnpQcWEE6+pjawAMKxxZL88fDXXf
 RvWbsyiEr2Z21POSUuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280072

On 10/20/2026 3:44 PM, Atanas Filipov wrote:
> On Tue, Oct 20, 2026 at 09:12:03AM +0200, Krzysztof Kozlowski wrote:
>> If you only need to solve "last writer" problem, why not fixing the
>> clock framework to accept the votes? Otherwise this should have
>> description why it is an interconnect.

A follow-up on the second part, since the problem turned out to be
more than the last writer.

The last-writer problem between the CAMSS VFEs is now handled in CAMSS
itself, in the direction you and Bryan suggested: each VFE sets a
clk_set_rate_range() floor, and on power off drops it and sets the
lowest rate explicitly, so the clock no longer stays high:

https://lore.kernel.org/all/20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com/

What clock votes cannot express is why I think the camera NoC is an
interconnect:

 - The camera NoC is a bus with several independent masters: the VFE
   write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
   and the camnoc AXI clock sets its throughput.
 - The consumers know their bandwidth, not the NoC rate that serves it.
   Converting one to the other depends on the NoC width, which is a
   property of the bus, not of each consumer.
 - Masters running at the same time load the NoC by the sum of their
   traffic. Clock rate requests can only be aggregated by maximum; a
   sum of rates has no meaning, a sum of bandwidth does.
 - The rest of the camera DMA path, from the MMSS NoC to DDR, is
   already described with interconnects, and CAMSS votes bandwidth on
   it. The camera NoC is its first hop.

The interconnect core already sums the average bandwidth of all
requests. icc-clk currently derives the rate from the aggregated peak
only, so it does not use that sum yet; that is a limitation of the
icc-clk translation, not of describing the camera NoC as an
interconnect. It can be addressed in icc-clk by taking the average
into account together with the bus width.

Is this a valid reason to describe the camera NoC as an interconnect?

--
Best regards,
Atanas
