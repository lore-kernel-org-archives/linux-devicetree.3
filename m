Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999613AC0EE
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025875; cv=pass; b=QG62LDV3x23DtgIgRR7IX54Sj6JZqLYBDv3/KxgHPhYuwP5TVl3k9T8neRb8nIKP4Pbd3ZcMWlB+Bf3gYJA+UqVuOk46NlVs37WhsZPNxXbe1zpOe5fKfq9tl8kvRIXH+3mUxiO+kkhVeMWW+i0h6U+d0D26eiyG2rNlMV9znbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025875; c=relaxed/simple;
	bh=QSTsi0xJf3W1mpjWc0B8G2aXS3mqDz2jPj3tOwKmY1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeFZRpumgkRzQ38yVzj/Cl8k8lnyMlw6CQdzIYkgy/kirCCZsnFfQ703gx/SeO9cF3FJ1gOzm2qTM1FirEVKdLDcMV3Gfmh4BSy6mgafE2gWEP8YlXp3iYs1oQH31HVt5GtRHLEgVqBQ+nyPiISVqsNB3s12GGKWFoJ/4ahAJyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2oyxHBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez6pS71k; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2oyxHBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez6pS71k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Atkis3463634
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=; b=V2oyxHBBB1jvM5Ow
	crcDF4evfefwb0OIznLHLFoXGMh8i8tfuPMFKahTZkdWR7PrsX6H09frhmcdLwLX
	6FyrQaMvTJ0KxitESHH90u60fJA9QnMRhB5gQp18KmMPPriZaT21Dr1MObotAKcT
	VIGDngQ5BrHBgmQVBEZhOFJcFntKAn5nupT2bRkQpF8ax31aW9/FhpAvcjRSDhw4
	tUY7FWyVu19KLcvjcrA/3Pe2Q06+UDZs3sB2wbeXL/mNxxvcDFLw2qynBj35j3mb
	rcYtBdXHH2h6ozG9pubUOJ7ejMv9STp07C2ITM9nR5hztFbge7lMqRaGtUTiQLqz
	Sy2YNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08gkda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 11:11:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5cbd8e78a66so380160e0c.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 04:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025873; cv=none;
        d=google.com; s=arc-20260327;
        b=VU96zH+mbDDkB4fx6R637sE978bQsyftn1lfB1/WM+CXtcFg3Jdj3pgy2/ZxY4NMS5
         +qNQujoSVlx7AwB1lExjTYvtkqGuz07XbFs954xcRmQuJL+CsxfGTfJ2/F9/8gNzUXhT
         wubLYXpmKm5kImWpOA+zb3kjaK5HWMUT/RgOOq+dzxWxvULjJFfgDzn26/VVR7EaHB2v
         Up8pCq/0knhI3FWmqwtGr3zV3aVCk1CWHXz8pgw/6HHUW4kteNoeIg43NdiGQoTI9Oqa
         lZEAg2+1STrMat+ZxXmucQrAV9s5pq7lpnOKJxd7VBeJnCeHfA2TRW0v4xWfv8n7SXrO
         1VZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        fh=aP9VNmWSA7P/jgRXBhymLjQXWY/Ps1QCLO4AG9URzLE=;
        b=QZku+eaTySqPFIEXtsv24igzywm3fpBoSqdEt7Iz8RmfGMga6GH1iHwxYleBLnMvnx
         /yzYpt4/TM97stU/pZScR7OZ/N3uHJdeK0iV2+Dm9FGaZS+uNHxegecx7R9LGmhIfFKy
         Gf1585ON/LfZF0ep909LCCD+203P3qiM3USlk8U1V1KTcH84NxqvqpUSl/0tzjp0Ra5J
         Pe6aoGER6+JKQEbee078P681gBhZaMXqc7CxbFzhj2MWiPdRlhWCk4g/msMArhJtyjWg
         AZurQYNmJCvhHGsZQyuWhFAL/jGlFs2eI7bzUYBd2arktjq3U7FYGkQzFDV9AhrCmvDH
         6rfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025873; x=1791630673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=ez6pS71k7225yfO5SQ5SIyeXqnSI3ya+9mGeI0QVId4tIHRvmUrWmUUGptxbB8smOD
         PeetxH96f6CI0DdvX7sXYqex2hy3dQaHLDYHJVAklrQ8iQyTBbwn+IRtnscs1j9drPWt
         vlMkD/F1ewDkSNmzbiPK7dgEaShnxVIAPjjhozlY0R29IOhOMPiwHntU6nPBYN2KyxWg
         Qp7N/li4CFsT+4ZEPmmkJD+kbQSeF/AKZsSk/JiLX2Vjbl9LyN9bZrc2Nk6OQDNGXtDH
         R5pXF77jFVHCCcWOWH76EVn//N0aKU+8A6AkMvMxmNljjg1LVOwZbPFaM8jtcMXZRw2e
         7t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025873; x=1791630673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=p08R6qjM0rFza+0V1NqojFVDmalVqZ4shfTfNewg5uy4B2NohuF8Yoj8/q+BdR8JZe
         u9YqYFiHKyyEFlQQD6Xjr4nVdakpVwGz/MIXIklaJ4Psnrg4QShqh1Cl8liTQ4kpxtd+
         w1wHzZKhfzKwFxezYcVrvQr8cK/2bfWGgMLgY/i7Lh/04+HzmfPMqpoNHcg6sHupJ0MS
         P/Yd03bMKLSewtFxo15CJKzWKUtfrI1dtQwCQLszDtwgH2ODqJeLUjqyONowNzV47lRL
         IdSSoIJzpSpr/MwHyX9+/1v7w+j8rSlBynDzxGJU97JKykayZSSq31wvmYfgJqlZMT4q
         x+1w==
X-Forwarded-Encrypted: i=1; AKwUvBwtryea+odLkTqclaBpRBKnCDnRMC9qqRVAN0gHx9iyXUiNkfSAiQatnBPv/vRpgfqAbjxSh5lHN2aG@vger.kernel.org
X-Gm-Message-State: AFq9FYLR1gvYespB5SawFk4FyS3Y7hJJt9BUoGzxkjcT7Z2CPqqYY5Oz
	jBJ/8WPY+unBilbaz92d68vOOwtHjhl6p0CNZ4N3RFbTZE2QIJN3ZU/RRWxmmEvoJ5Z0oxTAdgx
	IcBnpk9hmix2IgcKflbPsRlRVj1U9ivweagn0Azd70WyN8r7rjH7LKFc3c/dneRfTguGm+6z33Z
	9QvJnLE0TfbelwTHLbwvJOrTUqYHEz96wnHnEzx4A=
X-Gm-Gg: AYBFou2LY4r4NHU4NZca7QzlGyK9u6VM+2e+6vhnKU2/KSrCXiucNDCf/dMzyMi0LTS
	Jjmk7St6iOiSr9Ou6Cr8t3EvQYFaYssNd/7P+aSKvNXpOgN3NgMQH8tW1nMZRL7COyca4igrkfv
	+pnLwcesfe1vuQ5TEOmg15HSfa4GoKsLizMVrhAZWr5rvNsBhDPA9gaopNRXI3L3kHGd239jtKB
	sEUMC+cOnqSll0Dmw==
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id 71dfb90a1353d-5dab3357fa0mr1691066e0c.21.1791025872951;
        Sat, 03 Oct 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id
 71dfb90a1353d-5dab3357fa0mr1691051e0c.21.1791025872550; Sat, 03 Oct 2026
 04:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com> <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
In-Reply-To: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:11:01 +0800
X-Gm-Features: AclHuK9kb58p-lhxZ0JM2phaLs-oK0O_r3eZlqRT_1LCVxXx_9IYV-_oLUsV2-s
Message-ID: <CACbMrhrB0k27wBDgADSbhD8Cjyx_-xBvgCOXcwXMxmxxuEhBGA@mail.gmail.com>
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: QLqLToSE6zzhVD8Rt58P9CkPl7pcHUYq
X-Proofpoint-GUID: QLqLToSE6zzhVD8Rt58P9CkPl7pcHUYq
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac0e2d1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=kQtmRZuExVT1y5CfGhAA:9
 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX0UaUpOBm1ORg
 ZqUMy66lbGAu2V272ueIsZHhKkbw7KYHEulxaeCwDEcr2rkgukZGpkiOP7ak4bw7rUF/XTFrRZ/
 YB/hUBrk8g+LyQF10oxeWulS0/3G2qY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX+4PNuzFLdEO1
 SDkAl5EhsUFEORIzAuTDOZ517jQq0Rj4RQkCXbKbwJu/cS7HyiylTaC5P9dXvYfaa6tChGJVLfG
 CMJFkMShTQfYJWdcPe2loY9kzyzY0UhCqzLdc520BazeOQLAH3jHI+ZkqK+F+isj2IbC4WXDpKW
 gwF+caHRBgAY2VKefBUOqUlfAQoT9UleQpD7GOo6cqzEy6NOTUUuGfTTX5tJpgzpXG64j7sIwCz
 5gNbMv91wE5VTUdlwqf5BKd7xl3B9UmhK1AocYLOQGx/hPQmlS9zN7v9UR/IRiUrTzMPVqzOx1O
 X/jJLTUZ2GCO7bzSvvBOqWwaVzjbiGcrS1dvOODP1gJGj5mXutSqcaYEHu0SJHUIj2Jw6w1yam8
 2cD618nKm+MpPgexTsEPTzpcXikXhMlfzN6pc9pWFxubJQPqsrmMDi0pgKk+FU5ymnK89FrEw3Q
 +ImjmIA1QTmCiBPzN7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030044

Ack

Best Regards,
Hangxiang

On Sat, Oct 3, 2026 at 5:09=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/10/2026 10:02, Hangxiang Ma wrote:
> > +                     .hw_ops =3D &csiphy_ops_3ph_1_0,
>
> There's no reason to continue to use the internal CSIPHY hack.
>
> ---
> bod
