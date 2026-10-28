Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201292;
	b=n5hnWNfHAp8bHmkjUC6CNEN7W2wbLVDJqTKRU/UpvFTxEOQ1pxyS2GacIs2A+VM0dDGv
	 2u/zqVtJ27m9WZvMWOtbGPDtGvH1rKiYKr0saWAXkBHCX0hHsa17t0OJ1L/6Hu2wfckgA
	 ultg7eSsntrM5ZfFxu/NfCe9vRJ7sOdI3OGikyrFARCiaMYCKBWsn19FHA2sySxDRoY9R
	 HQLEapnckIz3f5Tw8yF2tDhGQp0loB7Wb4TjNu42zO6kGQ602OCVTj5cbSQQ5fra1VGAx
	 y+KQvwHSPFnrH7cR2EZ+XwONNPmS/2qCZceXu53SPK4Q2w8tpd0bMAvtFa6ia+DUOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
	b=ZJ3okNoPP6qEKkAyR1e0btQTg5fp9EyzQJC/Vo7bpdeAa8+AGoq/CAbPDKhZLKoytqfE
	 yKFALEthuWCQ7CZwwF2TJSIMB5NUiWaui7p7EaWj1IvkMoUlHagPq7do9hKMlYibq+SKD
	 S/cwLzyw7sIwslh9rNb+FHNu+hHrZ2HDKztW4ta5dkOV7zkh6Fjv+8fiBrgPLQ9Vo03Xn
	 Lgl5DEknP7mtGzgKZQqoi2CheaHQV/NQ7YEcnB/qXBvbm9B6NH5kEfA4ulBVl60h2xXva
	 PUBYqgp7h8fLmHCvafO2Zah09QRRNkNIhJEUpS47M6DeSiz1G72/8vAsfcM/fLkiAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D2606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4Xg600113
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpa+XQp0QDFpzE7hdPD++YKP
	Oso0isNfYovif6itICc=; b=mlQ5B+eEc7Dzq5a66JgUvlZj/cQNxd4cC18+XRSW
	2c5i/zV2QFyO8Xa7hIhJiaYpvp6eBsES4ePVEU8DznupN1OTdBf6CGQ9HFMVL1nt
	CQnG2t9D0nkwT+dET8JjAfy9n1e9+6/H5f7e2uG/7L7z489cZKaKRNcnwNQdI3pf
	tjLSuAYkP/S8BqIbPIwM+HN1FFr50yUfIAN0dNUaKxudRAyKooFM7nmUHwPHQx09
	jmslFQc+gSN7fUGEHNnXTE+mgAW5uP/XA2t5p7elt4nGKl+tb36KcksFMae6ddqt
	8nP20cFo0iNzRrl1A+3hApOjNIlrRiQjiuS9IQVIKMbALg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9367b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so22866137.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201291; x=1793806091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=U2LUuQKRJFlcHzgU2KMgH6TXXkKcGCqVHmWizh7oDkOHpXGZ0sI+mqkd2HkRhBF+LK
         m0GCfSatrQIVYFpCuKkL+Po6hKs2RtTfd1+3sibKRNEbe5WXSBqCWOFBxVb5gOck9w/j
         0LwpDw7wrnZE6R2BA8fm9MzHPl/pXpCwlbaG2OiNFwylH/rzs7/4EhHwfys65XgAYodi
         Qw5Kx/ETmMgEywOHXC6McRtfzayzpHMC4UzQE97JGxClEEeYXOwm6wgKRHt7ZvXSAYNK
         xGhRoBatds5Wo+fQvuHyBGieOTJlWS46j8y8Oj+HQgEyfqFcwJsXRuCbc0Z6L0i+33Pt
         ipsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201291; x=1793806091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=vU1ns6tQMKzmPTE1k9UcAg/BsoAdDU82AOJHF27c87tL85St6QRdvVFE5GOFUy/VVf
         k/eymSMxJCcHPNoAHue3gx0BvpdSzLw3pdQ5OL8wtoO2rAghsdnjBKUxQXdUxxCYpa9W
         sYlH00Fws81yX++DH+1+3/QVgMNEwtlbVYDC5yCdi6cZ7EDvn7t3G8GMSOAi/h0NJ5Am
         Y8/E7Q8FtaX8WkjW5e5hzsK5H+MxM7wRfobt8N3iUAjeUjIBOOEDTYzUQzth07AHjHtf
         WD28w3sm8+fTU84SlJNFlo/AxaTSKdX3G3VVx0Cvk9BnuzhacQdV1UcA1nG9kuqbT2Lg
         upAA==
X-Forwarded-Encrypted: i=1; AKwUvBxuLhuSeb2lpL8ZZdX7SpklVOvPWVwAqBC6ZmlB/pg3XqmArl6wK9qKIPjsnkEio93VLpNRjify2a5e@vger.kernel.org
X-Gm-Message-State: AFq9FYJNz7ZaUmc7SL8oZXo+uqJsM2AN9qZcV4NSk35wWLjVmsx+yIEq
	pHqadd4eJOitp9++xp2da+keShV++oKgKQrzEFQa1pCuQ8N0yt9b+u8gOciICnJhcAkH2310bMJ
	KNgfDSzdDOrlA7n91nQPc7i9N6povOOunRErIZpp88KhqxwPQLNEWhfDuD/ncYj9G
X-Gm-Gg: AYBFou0hSoFnahXlpQLFG3bfT8t2hyEiZmWTCaRLZEd1kBT17rFecQ1ml5JDWA3uoTV
	mebTLf0obSoBMpSbm2wOhblbDE/fJbjxmbg58OVC0aQJI5cNBcK69BzbAwpnPVyf6GNd/ZHyNIy
	f2o5d4U1+S0zQyaDVh9pluw9Vv6WYndhj+OQoCOvkWsN1gWvfCcUrhRdQpQ+AVRdssCv9l9Lbz1
	8vOV9Xa6xIQDs9GFF/VuTuneNsv+xVtDsctwUkO86sa8i+J1bj3pz/cozS0rOIAcwo5RBssWeiV
	lo25P6Hsr4W1X62dO6+VI1/8HtD2iCmTiyIIuW6YuFNaUfnxUbcxbRwpLDgtfAgHpRN1CMjGkIQ
	wPbxUGPRgNzi7OudyDT5ukq+ulWtb3jfWu/5WmBo9wLtqMnDPsNDm+faYx01Qcfxykg==
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496681137.36.1793201290622;
        Wed, 28 Oct 2026 08:28:10 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496628137.36.1793201289890;
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm54505e9.2.2026.10.28.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Message-ID: <5uovgjoe7w5z5equxekkmcnqhlmoi4ruuykea3mel63eyyxh2h@ovvzdwu3hfjz>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae2148b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4HpnP7yKktpVlNN_chcA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXx8QJ/xOp2xNn
 n0lBaqmdLT87mkP0d3bP3mkyckTmtYCU1ZqF+bheSw2oA1Ppelohncaoltf8kG2VCPyWrXvA+kp
 PSeCR0n9LFNL/3DU923ANleA6dz8rSo=
X-Proofpoint-GUID: LgM5v_M66v0zh1KP_jytTMtNPC5oRb0e
X-Proofpoint-ORIG-GUID: LgM5v_M66v0zh1KP_jytTMtNPC5oRb0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9EPCPngOko/e
 uchEUBBTeG2b27l38R804q0g29uCdUKWp72Bp4X1rtCmzSdFECiDY6OGDAOcpcRlpd1oeHTyRsC
 7J6s7YZfawtmGaQZyk7RTp3Oy0d3uW1LNiyRz45yDyHSqtPxRVwJRZH4sQ7/+MgI5OVsmEfo6UE
 +QWDWjfoXBgGuwQYIiNsq8ymGgcxkeQMK5H7O6ywmoH2GrYuLK5IqIbWwKBOXI1hsL2F8RKNzh0
 9qxigRaPfdK0mQd8A9zDj/KPGUwOh4amjvuFIgzjHYUWuZP8ONRguFzljJpwvnw8OkueVHrLbl3
 fzRdGQKm0s38+b6FEI7WBSMEq2lZph7JB1Eo6+VFB/0Kv5GhVpSJdb48Cwv2pxRsv6nLgXXay3q
 4NhgB6KVNo6gj5pjBCvIH4iZr2l7Eq1ZSTQncXd8DB+WSioJG9fWusi9sIXbELaYQ5R7A5LGnL3
 y3k+po0YWgUl8OsXS9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:46, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.
> 
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
