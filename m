Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702025;
	b=wjOyndfppHiZiGCMv0mSb1DlKoHajW6w/wjW6wVP+NPjW3RTYzEpY95F0CVXExLsxmRC
	 5Mj85Vxqk/Qo3LYPVOW8yzmOELBTq4ygHoWhFoANVxjjFlHOdMTdEd1q34Z5ClqPHri26
	 eCC3xPrJUSuGPX19ij1hCnmyu+d4uQ8pWgZlGwXXAh6At1kFjEsaaVs2Hpk5JBMRg0teR
	 tgy8E5ackJ1C+8l75N/vZydwdJWgBzaYjkCw/YDYzkqt0RXe5YcgFgWPNbKKiiGNI/NKR
	 syD9CgsYZZzUjE/elMn1gCWR7WAGz5SqafdNyQ8Xrw0Y432DtIf0M7u83eQ0E1EXP3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
	b=osAzw79QvmKjDpugfJl6L6jqJIFYdb7ktoCpoxLHiM98TZDmwONeg3Kav544yfzwtjvf
	 NzzuE1Z9prbdTgE9BSFiRRKwHm+RXM/vVzvbVUZ2i0u2aSwbJTbdSVL+j1YL6n+QXwmN2
	 SJZkCic7R+tWf+WdavUCgqaKZms9kwqIXhT+c9vfoPH06/w6nJWmjrNv5NX09ejOHKC3y
	 ZNbtLWv+/7o1RjdhTjiYCb0fN+h8j7OlGhshLaxYyiB1H2s0rZ+hvynRidM1561v8L9PI
	 zGpiWu8G8KAnXg+Jfc65hgjsFjm5YasMZTr2TnqgZtjGwPNzK0oxGu2ob6hKlqZpB2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B918606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B918606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVtsq3178282
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=; b=Sw5kGqNwFaTKAS2L
	IZeVisiDBKK82mwemBnbAy81qlmiMN1AUImIrNYT8pIEECDfD2aeT8YbyKZClQBA
	YPFS1RIHxSQhwZU7QiDamzxat9Qis5zBBXWhy5Nel4I7GOepm+pL0a9nktatsEM1
	XQZY+WwB+gtFisxUW19/+B4nWWimQdJGjV5v+U4hDbes6QmjOR41MHBEISAFQa9s
	bLhJIwwTvK2lad0UlA7DHEyihXQKlAMKkpE6FnUOwUTssr6HoEZMPgQZoGSf1L+r
	ifwv/DD2adf39rK5CfjoZHc+o8ACMdFoTcLRQD6b2lkKGInx+YUM/BfV+Vz+zMU/
	B1JthQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbdyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e1660e7e6so95289241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702022; x=1796306822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=X3PNFDfVk4txNkaGXm8Ur1KS/Rr6/X4nwpcMwLVIkM5utJp45jZUoie9WC/Y3cMkqT
         CxSn7WN/irAy4s47D9aWm7PMsnnwui2W1mEg9dQhROoDKSWEFk9w5DZht7t/ftwXWBMx
         rzu9mf/m5CQRi2ebafUdOj4YuyE7BFfi7wzzCBs4BM04OLF0jeDy/flhl4d3LGgwN0t3
         Gg8HbLH2ShmjTvNYZHbvFkTYFOvJcpgR+79Mo6G3ZRyVeUJbNbXFaYtNKqTmdDsy8Kiy
         T2Py/fN15gKUXYH3Y+Zq+rOGE4WXPfBEkFN8eNj1B1kuB1qp+jzWBTJiLjlOtTL9f+/l
         pNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702022; x=1796306822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=HeyLihKLT6wFMMdKKxyBgPApv1tD9DSXyUZ34vBvyMF5fmiIHbONT4wTn9OI10d1/p
         ppTOEPMrk28+TRNeHZUsL/b3ZXnY4H3LnhHPuSn+xBHIpbIrPwK0ZIIBI3YcAQA+/tts
         yUCFzGQFxuFcc/35RXwUORQxkMNeYGu+Ve6r7/3FJpgPLKzFfQ60HOk/fhidPFSNWtgz
         6h7d0xTNP8OMPl+YRbzS17QI1tKBTggJYExVtF/0Zprq9qJYbL7SM3/sCRzxqrOFPTe1
         K+drjecwsVdv8jeV1X+dwrIC4qb8sRnPYAur1E5ZQh0baCsVUeRDgVsn961xXBEGdeQG
         o2LA==
X-Forwarded-Encrypted: i=1; AL+hErFj9Cqa3Saqq3ELj2RNbV7mnZJOKkolha2eg2CxoFSr4MXkkS+a6GfX0SZtq6w4ndoBYT9QxKQks1qr@vger.kernel.org
X-Gm-Message-State: APuU4Z+pQehR3uX4Dou8VYgVvY3ooVcP5HgopmwcEhONQx4GNqzTqov/
	VTLtZpmhfoEbZI0r+NUvg902k7Ij8pql78orIFJgh0wRCwuM8JJXcIDweKRGFDUhM7t+81t9Kce
	PM0i1fCrQQuNLPbvBOioLYIjXwV14vZbTBkz4iHPUQ/ZVP63wVWXOY42a2E4B6xVF
X-Gm-Gg: AZFdTZcZL5NBLrtzUBwR4i4d8gcw4J7Sf0ntYbAR9MmausYFZ+0Z5d7X3sSEh0BvlZI
	9rwLzdGIfS87J2OxrVEUYBNZ4+yBqcYFGdj/EPDM9S4DrN7Yqh1hBNzO1OV4YBa8Kd7aL96D1y1
	hzOL3BbYt8KaStrCkYXoD1cAxrMyeRFOZ09ds4itAFUvFj2+mQ0SDThyu1Ezb7+6xXWQs2IZcuO
	hm+HrHFXcQ79265x4/CM4CS3b99rP8MVsmy6PgYROb2iDQu4dCOpVi1dfQXHMFb+51Bo+ccaAJM
	Wl6oOSGJ0YIv0rcALgp0OriEMr8AmMjy4+jPIO5WOeAh27baXgzUkzlD+ckZrRR9go4M/l6e9R/
	xy8We9WznCuAfyus8MiT1vl1ua6Yf/sLqf4vHfgV0M2lJlZudOjqajGIP1/Miy4nuKq0ffEjYTd
	8fCX+j0tM=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218603e0c.5.1795702021787;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218529e0c.5.1795702021169;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm364063685e9.4.2026.11.26.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:07:00 -0800 (PST)
Message-ID: <cbf38851-d20b-4242-95b8-28eac985d21b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:06:58 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b083d06 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CjxXgO3LAAAA:8 a=XEbodZ_ldB3zFuGnKb0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: hRZgY5pKyxuQVUSW8rvf1UxxKkDb8wQN
X-Proofpoint-ORIG-GUID: hRZgY5pKyxuQVUSW8rvf1UxxKkDb8wQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX8CQXVExJNizR
 kFPijqFPMx8vG4xOSzfuB2xbb6jZXxglAmqGpKgn+tgLC9SOA4KuPcG1TyREA7fjXGqLuCkPIZ2
 izS69mL2qHbY9woFIMn2pOBvwqn/JZPAzO3qnKqrKtpZQw+hIU371s1NdzLXSPcfJhl+HZkvW+4
 kECygQCRLV7KPdiAT8b0RDzVNBMgSbxErAa8Dd6wNnPQtycBvxrVTbDYzGfB0+/+tiYZch+5UMZ
 de+eN4XnW8K/fuDC2Ibf9+6pTxvRDOYdfRog+M6Qep8mjzMHdvYP4AWCD6zygUfJeo1/hrOWJ+p
 m4iy5LWByQf8ODFN21GV5dEV7glWCFvh6BamSrVav6hO0lvlqt6Vep14S1iqSTEZGSreARNbWMG
 NOtZRfyrcXizIUiGwmhDlXbyw3psx4xqE+M4fC1Io8+nS6/APmMjUfxOuQZaajkc4rD1rIloz0R
 jt+kfhCOa6qwQ6xs62A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX66dL8yzemyMn
 1yYxCwreLyYCMspfCUWnQ9Ob4YMutVZSPInDRbPlI4KoRfzGy5J60UBUTK8KX0hP+pqHCPFhlu1
 gLvU7YsmX/qiq2PnfbHwIhLqmchQIbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055



On 23-Nov-26 17:03, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 35 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Please drop this comment

Feedback from an LLM with doc access:

- Add gp_mn on GPIO127 at mux 2.
- Add gp_pdm_mira on GPIO35, GPIO146 and GPIO147 at mux 2.
- Add gp_pdm_mirb on GPIO63 and GPIO72 at mux 2, and GPIO88
  at mux 4. Keep each mirror route under one function; do not
  create per-lane functions.
- Add RFFE0 on GPIO138/139 at mux 1, RFFE1 on GPIO140/141 at
  mux 1, and RFFE2 on GPIO142/143 at mux 1 (Konrad: maybe
  let's keep them all named rffe?)
- Add grfc on GPIO79/85 at mux 1, GPIO138-143 at mux 2,
  GPIO144/145 at mux 1, GPIO150/151 at mux 1, and GPIO152 at
  mux 2.
- Keep qup2_se5 on GPIO17 at mux 2 for function qup2_se5_l3.
  Add a distinct qup2_se5_l6 selector on GPIO17
  at mux 3.
- Keep qup1_se5_mirb on GPIO202/203 at mux 1 for functions
  qup1_se5_l0_mirb and qup1_se5_l1_mirb. Add distinct
  qup1_se5_l2_mirb on GPIO202 and qup1_se5_l3_mirb on GPIO203
  at mux 2.

Konrad
