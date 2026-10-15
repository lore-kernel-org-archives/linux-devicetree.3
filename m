Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFE4C041B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061328; cv=none; b=U1SiRcoxWgqHoYkQKNJlyGsORRD2DATStnwXt2A5z7viBD/GVOrdgpW9sz+zdDaYEHvfTg5a5HOSTXeGCfXLp8S6RO+dvz57TYkOH1P77TKUcTEpcbGq71wWZX6oCNzj+g7SBcq8o8YSFsJc3/sg9d9liOqXoP8D5BTjtmDwL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061328; c=relaxed/simple;
	bh=gkVjJC6goWoZ1wVSLbVPp2ny8CQGP2kljYYcgJMcDx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtzeVp7fnBcwemYFHtKT5yb3+TupgGUADWaRDhdHPAt9IBbakA0nbCWD9itevyOEVyhVdj0CjpXDWANZy8tDA7DbHsclkyZxO5Sc2RgPAKLYjRaLtOg39qkV0PmTFTZEE7Uy/MWKUA67cy3OIks5t67BUaX+WQexrJgk53+km9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGEzkrva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok2VrMZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGEzkrva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok2VrMZ3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jO6U2114138
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=; b=OGEzkrva/xzsPw3k
	FFF52HXYiJffBL6gde3MMJzNJtVzIncBkLqoZen3uOFl+kNL+r0zdeTgyj5Dz1Qk
	T+IK2oulH1tDGYGdm8AIvUWPISjop6R/4Wjfb2Mm3pg2F0ura7Yx8QZ1PgPcMOPw
	hebYv4ZrM2gBo2eFdZ9hf1/6/ywDmG4DPJlfc6Cw3FkRoUeJpTdJ3eCjZIQe1Zkm
	+60p0vrAmC9zU2raXcBMcJH9YBA3IczUEok7NH02V8TULNNwAtdAKil2iX6SVji9
	iwVBtx0KzwePLreL/yx4b28Zw6XjhQ2Oh4e0XMXU+bdBhY13n9Cy7RKYGW/kBUUm
	l0nREQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyan1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so16369181cf.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061325; x=1792666125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=Ok2VrMZ3ziwiSMtFVuY8xp0s4hlha7ud13EkWTg21K8N4TGzgVjYpwsHQajUbbvWhz
         FQB8mTiDNgJXATvlsUSC5jzVW4njx525VzvFEqQV2GCysielY9TnyoaONb+T2IG6ufSV
         yBLK2iuqtHUJ7fl1tAkGvGX4Ek9/pHzvTcAgQWlS21jEXDa73xdJKQc82nRuF8RDw8iF
         4g1OtzwDyy9YJ9y5lePT4k06uK20JuneHrtoy8Q34JUtcUUDyVMqUOYZZXWQRkGK5AWi
         OW5DPXhS5M/rV5omYOiuaoUmwD8JeHOdvVKRED4abZqaKFT2tgsaYemPbBlKLaogP6uO
         GUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061325; x=1792666125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=ZmTlV4mMlzBWuabbaSTYDL/EBKqjzXiT8YWf5hsShMGbqJ2F9iM04+NrVQGpNEOkOP
         QFQ+X1C70l3xO2ZZ7TRQX+bGDTYiFmO4B91jOI8GDfUxzdV1QfCJBVaG0sK187fHi9it
         KtKhWMS8Nvx4Cni7aa2j2iIXdwGzFyqOQ+NRj6FBkRoExtVO3UA+XHKaVbpmNmGAW1Fj
         aispxwhckL90PnDSUxRcBRhZp1BdZIWmj2+G4So57As2Gm31xny7xHbFK/gajROzDCsX
         vBoDPVa5oPuke5ZM2/CRrzM6vGUPKdip+7w39gXI7ayWzXA6AFj+OqKb52FZB/zQfB/E
         lftA==
X-Forwarded-Encrypted: i=1; AKwUvByZM4liNNf7uHeRJHg3fCpnfG7ThcSLJNWDS0hn+O+1L+C7jImVuzVrFMoFxGfuXKsEyigkXivjGNiF@vger.kernel.org
X-Gm-Message-State: AFq9FYJSz/qnw8NulESlue5kjwScbTYFdE4DLXcHY/pBjwt4V/ckjfaU
	/EzIcevoIaXwnmdfbEDBkyNdsNgdtIswV2PbEqKrqLD3WcH4zrr3vj2YSG4hVB3hGA4Iy94LwZ9
	qxN3n6sZrMV5bu9CyjMFYQI+mYuPk0RnC231haIXMo6kWQRiCUKxBQtX0kuUB84MS
X-Gm-Gg: AYBFou0HWGXHIzZ/Zf2TxqdV5h/t1E+KVovAr6UK2R6qGEyTyufywS/nRn5rPal5Wf0
	jEy5DHNhsL0Bc63gIrLIibx45Y0FbsjVZQMp6yxddAjvPs3/+AuQPxvLeSHvFlTym4xdO3TSPvm
	TnzJOdUegzqdTWZfhTbBZZbAqJn9VIVbycm4z9bnGYBsh5sBzLLOqajOymoMiPz93XxWwP0D3N0
	jOors9VK1E5r6hZ4GxfFUh41G6nOpILcoCOiJmOGTEj76Rp+hhLV4tu36DA8OWnpkQi0/J/27jn
	t7nhpbmTzYWyk7sE7KvmVUpLvetC6qySt7taoJ61g86CarxEeG9KEwhIqHe0Te9crxIgo5cdFgI
	Rv+593ac+C4thbAya2uO2Xg==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641739585a.3.1792061324924;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641734885a.3.1792061324391;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e710sm109029866b.20.2026.10.15.03.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:41 -0700 (PDT)
Message-ID: <da480a5f-ac8d-4dc7-8358-e22cbccfda52@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP &
 MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PKpePJ6fTUUGkAfE7I7z6ZRiib-sqG2g
X-Proofpoint-ORIG-GUID: PKpePJ6fTUUGkAfE7I7z6ZRiib-sqG2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX6LKjyXP+u4H7
 y6K/cYw5TLkKTUq6FQ1a/9aG0iUdy68HXgU8x8sKx4Z7tGDxYvNzrt477FrJWjDy6lN2mU6fICb
 3d0DzhvaLZQJBry9uMiTG1xsaXLSo4g=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0af8d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=81bJPUnbi0zmkLSSE44A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX9hWDK+ZumVCU
 JT+9hfkgHd6r8fZNwcwU4cg9PigDXavCXqxkj6bYnXbDxHwTiWlLEDFLClAoaZFbeOT1Hbiha9u
 /fzv7QkAifATg36hmebqUIreobUcq9Cvgs5XZtbRor8rDk4OWDvKeejNYuzaOqqWmT23BUBWJnQ
 z8B8/lTyBduyOX1QOkeoCdyV6y7iO1HfTc0uxQPa6gkVO28XVpm8C7+mIp4hiQ+INimbBPx6wVy
 XTSOhizOV51mObWpoMgkcA3Hm/EZMMxaCdPtsCgjvpj3cnF5kfTzcNiSmeUSQrB/WOwtUpVyk22
 aoG9QGCII6LF8gRZ9PZJIkRpzFUsZ9jZ2uI3/zaaoeMStHQFbRNeDW3zMoWoiB5JGFDJx8J5LkL
 Sh2i1dQY7eoiMPi8h+HuOfytbJd9cIz2gq1js7xt+P8qgEPJwOd/VMLn3pGpHGa0Kj6VpnwopZH
 NkNwG1lbAZEYtukReqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the ADSP, CDSP and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
