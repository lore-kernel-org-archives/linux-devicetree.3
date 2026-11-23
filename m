Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461531;
	b=VV7DhDX83YLn5J3xpYKmEbOf1Y8PqMIGOKH+3FD8EbKX0tCOkweoi3+/L23h2PQ14MU4
	 YkrVfm7RmiPM8W6Vg/b5fW0rg6e1DsiuqNkVPHwA++z520XyVkUbht/14CTu022cjRILV
	 AdCJwm1UHMps17JnVcgEk8OYBHBzaLT+qCPFrx51x2OeQ7UJXHuemsl74OC2ZoWjMEVTt
	 WG/fHI2lRc7EwABJJ+MAdmoE/9S+jCSw2a9nP6VF5cbHrVAQOS6HIrCcb1amNzMqSU2D7
	 cu+qVIMThh4KZU0Y1zRskwLey8rAAeSa2UtK0/03wcrbYztIlLsAWF0tDjPdoH7oMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
	b=Klhmc56hjRgR8+sRYtQtpDUALK7WIkss7maTPIxIh5JkQsQRQs6K4pDu/U6GNBNJTrON
	 8mQU7eQIYJHU/k1JwGXDtAKWkOaGiesyZpj6KuAkL10VenVMD8gowAcXC2MSpCJsfiCIX
	 LooY9Sw8dCNUkPhbL0ePaYrsQHkdvjKhZKnzpyttx+3IesaiSWcVAJ1pwaOusQSEJrI0X
	 FeCXajdZMa330PF3GuvkZX1L/sLH6keB3l3/W5lRP481h6de/bMIu+7nvIq7XSiW2uR0A
	 PtGcQHaepGHagG1ZW/lPZQJciuw1EKVp1rl+8EdaSLtJOp+R1r2DbAHHc+nSJ1ugLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940E606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4940E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH5wW847547
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y805Ldq0zOs7VHrpsV5yAaD6
	RgPx1BBPdzqAj6Loazc=; b=Uzw1GTOvs71GjbbnZoQOslKHhOfzZgdwsQk7+dRY
	d8jYEw/EYA9+lqVBIXAIFxRIzyf5Yy/mfZGJe0CZVZ8Xv2Z2JKkYT9IXxaDPE/ER
	hWdV00C+bYN++LgxazNM1aBbiAyolUj/uEKcyDXN0vqzUx+vv0zhXsA4Fyp7OHfH
	3mrdFTBRVG/70UVForVLuCiNzbjQKOz5tmWtCbhh0ItuMKMhabtOIZlXLCXi3elO
	vN/KJ8htE0i1q56G2gph3oJit+LIqBLiJ1/9fs3SuuHocF0nWacg2kQU6p65Px1N
	/MDkQo2gVK6YnU05PTG7xL6ezz6lRfrrJDGoyt/gSBMSYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7433qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso708439885a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461528; x=1796066328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=SxTBbLJBGFViykrJ8MrtAkKFQNyJwUXCO+rMKjQeuGjhLYs1+TlsRnBX1UvXLCm58n
         /fOqRxAS36ZYr3OJGWds7mWPQb19gKrnHrkh3j9t4lId3h+/KGIQgf5bAgKV2vsg3QeB
         OtJHmzR9tPbNIqppQo38M2GchJxjWnAdlhYgSsHg+Lk11y2TjrOmz0nwB1t+MDzpsEUZ
         ADJ8B1nWC1MkGSIpV6HfmMv9rQaDJCVjnrf9tBByeNPGY2ybGkWVjzm6Tw+YmyLGbcff
         6DiV1zIgkdyTdtp/7sKbeeZln7EOcerxeVyVvbZcN4ucVQhKrVJOoCMR66dpb//kvCoc
         vb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461528; x=1796066328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=xEabAPZ6NzUXWZOz4ik+gge/1HRkgO4GcTeaE560gT9HHIPYwWSD9foj6Tq6Vtu9fo
         IEPmOHxTJnpE1fMakGbVED2CAvLNDNcxn1MHmaRBe6EV6DdNzYb4IWFrzLb0dSV5o0rC
         CmXKHpX05fC/n6+bv2EWnkd6Y0a6bMgRqNxBv+BQHOP+n86UmmtEWMdd5PKJhCy/irCJ
         OvfMujJHr7+fI9oyU0C/hJFnS62ncsU31mcASBKwChYo5XzTGmZb2TaenWOSlsSYwyOb
         pMgxD4HkXmTrBP2JI+CBi1fH2jXQ8rI4PdQLG/hYWjqACSzPvP7wpZpnF0CTuLvRKikP
         zeWg==
X-Forwarded-Encrypted: i=1; AL+hErFWsVFqvpqbCTAfjRgViEYvAZGIH+dQPhEZZww74FohVhJNbOsNmITV4SPRQsQprEeXw0k4GMvzjNYi@vger.kernel.org
X-Gm-Message-State: APuU4Z+DmBSUYJp+1crU/D8pnp3MkAaLppRoJgefTWmz9bxK2e0Da/gL
	Fbhre85L2iqdCnzmm2GgkVJnaSEblrDRvQN4Nugm1EyAfAdEEyvl5F4bNNjKR+ZAkWlQv/93ISj
	pk0jbgUGg/eo8lIrTG8fpqNHrNeF91s0kg8+1Q52FPVLDpGdlQOuBlceOLplCaZba
X-Gm-Gg: AZFdTZevxJ6P0W8adAp8CzL6O115J0NnY3jerSq8zpGlcC80qg/rln8pFVhC/6m+VIQ
	hyKeyeRa2vL2EhUw81haBfM3taWQgV/qQyACGES/S6poS6Z59HmKFsMbJoXt7zjsDEw94m20jQN
	wmxoUuquSdMZ2TazTu3z8sDx/XYwjQ3JZUEyvIJA2kQxZ0v80wwGM73VJboZ5/KvtgtpGFGCJrx
	r8vGQCeKza4k3sK7h3Xbc+U2QJl7EEvrpOMibaNEtBmEDdXsBtj3zRVKO37YDrLHpq0EcYoRPyO
	rLJTsWYGUThW4CaZl6VX35EkWHfKEppS/yU53vYeMrdIBoUVQvtMUDdERdIIHi2rXw6dZkXSuET
	pDJa027F8WK2dskyXnw7g1i1cWpLzHSKr+fcYykwFySpr4++IUN2fxceR0fLQ5zPT
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228550585a.40.1795461528417;
        Mon, 23 Nov 2026 11:18:48 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228543685a.40.1795461527751;
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm144885285e9.0.2026.11.23.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Date: Mon, 23 Nov 2026 21:18:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Message-ID: <qdf5ekjjakcfjc7cpaz7zrsn3a6krlkktsygr4lvsunmrxyku4@cjbey6jruzhr>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-2-hikmahgumelar@gmail.com>
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
In-Reply-To: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Proofpoint-GUID: kS3UwGIibnpTCTOJLFO-d_HfzihyVgX5
X-Proofpoint-ORIG-GUID: kS3UwGIibnpTCTOJLFO-d_HfzihyVgX5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX0FhhsrY09JMg
 gwFc8toLaV1f4v6PXj6uR/JvXmni6d5RuAyPMXY+6Ed4rIm+jTT3N5aICVa5cnkPpffUL+0gS79
 ZuPhTbgjEFjvM/oaS/aKpzLmiBMFaM4=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049199 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ET__IwHBT81aRugf-_kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXypFOBkRrHbu+
 MEChaZuOzBLfYIJFPWUk/6LGvoB+tw6EO9+ARQbew6YyD8hN2dLDToCreVR0anfoyJAdbk4hCb7
 ipvQRyPXU3ANuLLWNHUAL5+rEeRo52un/IWIVCUNgt1OTn3eSwwXcvWBDJqcH4E6PSMIRgbjUS6
 MUkT6V6nVMYH4FoevE7prWJn7m63NxF3YyOiI35Z/S06c86cPL/UtUkwmP2Uyy1yyB+K9GyuTMl
 pSK0Yp4I3U7250oM+VFElHY5Ju/yqZVFF6n6n7PNFbg7PF9QhAgeTGA5oepm9OfZPAHpMSskEiU
 PaLId3767qE6R6MBu6RIN4qDKcGrQqM7aEPBUmD+NT7SpcieSjMtqIt49pXbdVUqmxsxO5c0bNE
 nEXJYLmJv58shp6fgpiA4miJKANxldF/Nkzcr4J7bIsuerXlNTyKb8mWn2s6Jx34PedSkpk2nBE
 QWlgrC6PsCy+SgZ+BdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 22:27:16, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

Please read through this before sending other patches:

https://docs.kernel.org/process/submitting-patches.html
