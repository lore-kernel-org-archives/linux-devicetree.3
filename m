Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3D3B19B1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860031; cv=pass; b=uxrWsTohNCO5WlD9QymysO0OnYwetKGdge6/fTMEfonKGxfQHFsliyl3PbqfSWNMmcpS3O7wi4FZBM6UncLtMeRTBj63lhfNIpK8sOrXprKsyq60SznxDLAQA6T5iUVNo4SXaY5FYOZZoUatsDi2GaRJ9eSF4Pq9j2ymj+O6w8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860031; c=relaxed/simple;
	bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7lyAcu9eXhIpDqFmrph1K2Me0kI3jnpvDA6fO27cZ4BB5iTArvESkh+cB2YPJKWJ3P4AQTWlc3Ca33AxXhAELyPe5geQzPVw0N9LnoBaHbSdwE3CZ9ICH7CovTPPnSlq/w/Lw38icYozHtnteOF0FEIksVOB+UxhcpcLN/3tF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8SvCnf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wg2m8og7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8SvCnf+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wg2m8og7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4OebO2197293
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=; b=F8SvCnf+rzcEb1jr
	SP2tBjclokgByKqhpYAePnw3KG3vXyJnA4Vrr6P8HpQXbn1WnM5UXetW3bwS1+LU
	ahbmPt+1zgpR3EDj8kWYONI7+BOx0/eLkLyF35L+3x+FaCniz5wih6vijJZ55kYw
	WtFwQuqGDnJgN+3meul+yZDWzSwXl4X9tyJ/1RHfYD6W3pnuBWLrV18qB0gNBhH1
	WSs0/u51Qv0Lmmuj6bSK9B61SEVjYlxeQ39bCgIK7pk8kvQN1qf7zyOpzToDeTx/
	Nyxzrxk+12YPsAHLYCPe7J9F7Ob4LuWImkTXxV/f/6QswRkO9Zi+eMY1qYymW8LY
	yTxuEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c371b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so137618121cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860025; cv=none;
        d=google.com; s=arc-20240605;
        b=LMuaLKerCFl3VDpLUAbPyA2S7LwfJP8BEe/AQN8jks7hocNGfIHmehWBV8lMSjylIv
         AQNQK4m5MemNJcwp/oeyuPwUAL7hJxtKr3cqX7g5dMtVhhIbvXI02uhACERaoKoxDmV7
         uOV6ZnlHboAdLDhHsFDnO5lDvwerPXBxVDTkSgcFuvUKS/itTSFwc2Y8kFkyslWBrWEb
         SK8EL15RYWKuEnHvaIBdvBK52LrenuLdMpSXV//dzEb5IyTKXsqEcEp8cgY4PPgt/Rp6
         prKEKKpPthBEzmflBxP2vjgyXEmIAsBqAy8UcQyGzYDaAiC8QvbQ0p3w1KlU5OzkXxTk
         wRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        fh=72wsaxBKQbseEU+KjANC+m9TrgzS7+tMP4LHwtFWOdw=;
        b=EJUh0m6tqy76VVD+MjMfz7SY251hi4F0qpc9XmSOcP4SIDSFooyJO47ykiM9aBEyrH
         sZBTbDHOzxa4JmGECHS9V+K5JX+y6QOkUMIEaCliqseGHpL0o6oAN0/fh0eYpRszKdGT
         sY+VZjq5Ztf3RNL/BZnJmuQ6KazUECNpyNF/mLa9MvR7OR0QkTANkgiENNwx3EEqNCwt
         C5fEYdz3mhvJjnbOGP0a1POmbL7zhm17x1nb6SSu7B7UTiM4xRLJbxtdCPbsy/Fiuyic
         Ej2GmTkzSTo9E8lCJ4cCGoU4ClvO8S2i6FUgX4wNmbV/+hFCwvgixX8TYSKSxln1mVet
         hnVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860025; x=1775464825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=Wg2m8og7/FEOmvQmm+DWaNSOthanxPrgtiHGoC9/aLKTUumcb2xKV8YfIpjX2aCn00
         QKAE+hc4Dl/z5bslp6Czes6ZYRr3l0YesTjZqrBPZRtENWJY5C7FtJOVKx+S5HWsyCm5
         MaKFsEUiaELymR1rP0Fmnqd+PMRHn2Rwn936wY3+xguy1oHoF83iKU+nBbgimeyuAFqp
         syLLfVbI9DOjWQGiwQWL5FRHIBN0Ow2a06krXHY8A/xKrmjvACNQP8BWTed7GqjTHEqt
         JgxiNoLj61OSFYPA2KNO2lUKT3cdTk12DZZOeinQl599rg35SiJ7JzwyFUGhxWR+a9cd
         d+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860025; x=1775464825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=CMwArDJQDOBykuvPwfdhVYuXXScDF4w2Jax6jDL6m3SFeZcYy/Je/Rd4gShbuyzANJ
         uoBq6+gWkTDmH0k1LVYVFvohSvEkDvceDXRJ0udNI6mmlSnu2+6RkrTq/tHZ4xPPO5lo
         8wUJyMkUrU6gseLscNo+ZNJtKnpJK5CocUMukVTIYh3n30/oID8bOLElqmoOkSOVnyE7
         XZ6GhLTzFDcRT9K72H3eoPRK1PLgHjFyyHT+fg2xHe2v4YvFOBI9rIKzgOIGEhh8WObX
         6BQrKg75FmJYh5mjdk21tFAwwPpSYVQOwVeUlz3rDSvEoHPCBctKC2fyYHCNeGkyGUDu
         f5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1IPxImICS4G3u2a3gn3LKkS/JwJNoHCibPZ/fmksYOxRFJdQgqABhMSj5d2AqZm8JyCP+h3owWsNP@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJYQIsrrcthWDb1Qm6ij1I9uOmbEPcpv6/CmAFkE4nv3B22Qn
	RejW5tpW8nMBwSsYHf5HVF4cEMumZQ4XpNyCpzohMRDGfijylz3oUqpAs3VIQYKDFtsUwM+YxhX
	l7Xmy8TH2zMeTU7wdKD/AV+8WaCEIFGb8VuvVHtKRfPpjmMrjXuWKjic5lHV7zUN1FX/0xKdj+w
	yJp0Sr7QQXCInV6PvZgMssKKXUfZnevK3z1MKGaAg=
X-Gm-Gg: ATEYQzySDEw0OwxfT7Nu/Bv95nsjqJG9bAT4XL3y8+KUNQFCLSOVBVrY+HBCGM6ngx2
	xNMo5Bk0GOVPii8xZTW5/bZSUaDKBKu1evw2FVVjvRjhQpz+Rraoz7RIPMTUu1q7aLlPyX2NBO2
	xpxxUVIL+i31w3olXGDjcLNlsRTyM6dlGmTbXY7ZVi+97ciYanSjC98RnJ5BgqpM2kIcXZBL3Mv
	+1C1ragtyjTXTJQK3IEhxnjhCSY8AkdS3z8ZOA=
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr159893701cf.53.1774860024924;
        Mon, 30 Mar 2026 01:40:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id
 d75a77b69052e-50ba38efe47mr159893451cf.53.1774860024529; Mon, 30 Mar 2026
 01:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:40:13 +0200
X-Gm-Features: AQROBzDa5JyLSXqlyeBHjiboYIc2tAkjG5mwWLhdd8C7uKXweA2tZXurYaWdQV4
Message-ID: <CAFEp6-3w570bA0=wRLJ_b4kwwcxVbV3zs8m3JL9nCwoDTY7tTw@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfX8/5/AlZWX5+M
 ms87KtRr+hrDSqzpxCPYw7edZVilxIiW0xBEw0G2pAtQ3zi6kGYnmrmmGH0NCDGM1F2Sa1oDBua
 VXKgMH45+iJxr5YGBtiU1C8dLKfQNa0ywH2XKdDiKv0xU0fSH9A0Caa3Dl9nvk4I0qMDh+f3WS/
 Hb9FzqfqDQL88jXCKpGjEdWMvh8EXe5Mm7gzzEwRLot/cAjCH0j+GQDBU2qrgMk7rE9DTAIbnMP
 fP+gD94C8RRKyrj2AubUwcXMXdBeH5RPZgohPtC2nFDBVWBz6atM5aIdoIRy2VcaprXF/WHUXCo
 aEttyGjr8RaDjs764VqCf52w0NpKgk5oZ7zEDUitLTTh7GlTmv7oGVYPx1KT10wwN4/3xMaX0cd
 gwQwDU3/9X2brxAT3t1PYtqk2K6w6Ka3kS27MjB8/mvdNOaPYS1+LVQA2f6+gK5UYXB/FgnPDnt
 kQozfwhF6G6zYnRdJPw==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca36f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XIB30I8Fq4NfyXnsoAUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WwNZ4lpNKx45QJnXbAt5SiIGthsz8y3_
X-Proofpoint-ORIG-GUID: WwNZ4lpNKx45QJnXbAt5SiIGthsz8y3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067

On Thu, Mar 26, 2026 at 2:32=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
