Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EA346766
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336695; cv=none; b=QprVD2YgSdT9VfBOTQ06vCSSLA2BmkBG58OiKLJjqnPIICK36bARrNwYD4WtROe7ToMum2JP36e7vrwAb/uKsySda+ie3la+myVD7j5SEX4Cs/oLdwpVr3RDXXI0gI26PjbHofdbvhD2qUo7KcC5drWtZbAGnXd1HI23vfL79NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336695; c=relaxed/simple;
	bh=gQkxawafjezVKnoesLe0QjCR4a1/sdvaYUZkwHBxPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4CYjD80Re6y0etvKpkHZqDMkt9+0Gz+KcFhovjgREt5yY3W3AY0GblJyMkoQ4pHrStDf1j0Njzzz6x8OTvAhf2rr6NfS4SoSvg2DPT5oXBzElFJOYKA/z5pUv/qRxH7HT+uhO5rp8AVYoC/jG+zRwMILBx7YfegpmL8eyy45Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8kwAuDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwK6Gh4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8kwAuDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwK6Gh4T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340hObR1346641
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssFVauwzazEx25EztfIJnA/7
	6jufTDwP8FuA3yJN8zE=; b=R8kwAuDXYXTUTL5cYv89+XnMMAdOJv+IbOAcWaiN
	gYffeAXc/CWjh5kYizRDTW7Lt8HhemkZWue8llOYkeFTTjwRuEVIz5v9DJRQZ8vZ
	53HKZ8pL4Ara+xjexUD7lI1XExLZXer8Ka9oYKTlsGYsmbpkmUcXVQOKKwYn8WZs
	Xh4YIWftpWZw3F46kWvgYQ6O/0Bet2UcYWdm99VJqduWUa2HHUyX1g4FiMwowup9
	uePYuqCzRjbLEWZDoA/moU7Cvo+4U2LWoPq8ju5Uo+yoDKW1+FH43CFfY1BrLZai
	PdG1mXGkE0hbQF9Idf9f3vkIpNs3eo7WyGz/XBP6Td2pVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfhqjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:04:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so9066181cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336692; x=1775941492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=YwK6Gh4TL3wWhvIguI4uShRnv6NaI7JkYhPfcAF7tOKI3KBqLR9PwbXDFy2/rcygjy
         2h+gVeb9v99UMBLla5VlcIWzUmC/rBvRJyxfV7IdoF/Nh56atZk0hMYa9mK+NBjzerR3
         f3DkA/rZ149s5/0Ey1W/9cuKMZsnMdbRot6uF07B2jE6248dmh7kioJzg9mOJFBrSSR7
         VOd2izolViIUTcEvDZS25XZt4AO48o56bh75rOFVRqBRB5L/LLUDEgZ5OfmuF4laGpVw
         gv3uShg/LlBGe3Suscj+ER6qH3Jf8Vs2PD3aOK8Dp+c1dE4wjjoSh8nEDrTkwkpGhm6r
         dp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336692; x=1775941492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=FYroq41myjHv0KTTHSIemZvmM8CcLA8b26Zc+GDt6P5bz5czVF8mQTJjXG2huOKaaR
         62RTorq+X4ZxwVpnaZyGdnvtvKfi4Iz3BtIzoHqlNoajYkmNJOfeFewjgm7vkNkV1rSK
         cn3/zrv9lBHyL/Ttpb4w+9G1jrMy3Fc0jX19ffPSNxP6+o0PM+MAzLuy8Ko1uUNG2wiL
         kieU0hv/FLCXY1T8JmtfBCIdIpc1Tj4QpyhEB2i7WH2BXCSyY7h5SBvZxyzYc4GqOuKF
         gTzXeuCGVGZz8oLr1MauefA8lBbHQXZ6YLDmOtlN8CZXeUAs3rZ58NirD5b0974OBB9C
         5L8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlnjkXmMrBrcklV8G1o8yYau13B/NkPL29WLaGz7YK0tos5FeBL4Tp4YbZKoIbLBXTRQVBDqcTnPgW@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFqKZLNobaiRNUK4g6dOcvPEh6+bkruX3Pfk25zf4+nL8Lhky
	X0T82nO8WRhIW1tAlwf/yBdJSV3/uRSjsEzRbnIKVVjRpeIvmfpIimNLjUgpIeX3xo5MW5U2Gsc
	I2+YDvuksXVnKEU1kMN52vhWZ78Poh7ne6+aK4tIQ+/1xPBw+CZItRFXsgHM9ggKs
X-Gm-Gg: AeBDiet7sxoHD+ky8f3/TTk2L29GkcRHOA4dm6K5CrzMhzNDVgn0ZUDJg08EDxGE999
	zy47fs1Ic8WyZoYA8ucTus/y3zO9gWr3NTQoFLw4vTLlh0m0pxu2rm0Ten0pvxAzyKT7M6dUv1i
	BimYChHef+GwcSDfin1zONA4DtxHsjxgweFJTcgqi+vkHIcMPhF1dNMUKIkY5HBbPhdgWabKMMk
	08soaGojYF6Drbqbo5zGkAWcfwZ+BnEY9u63MN5Q8nuHqYhzLKtBpJrWBw+ALfIv+1Rte3zGHfg
	LMLORgsnKMBvRI/eO41FJ4KCTkn9LI4x1sB/RL3zd9A46YK5MN8U+IrU1dPo/rMxWsdZiqyqzGU
	ITZyFZDw+ybp8enyF6KbjOEaKOIiypecJuyjWrgz9ymghHmNOmvUjpa0eEnwMZsvFCBULr0319/
	AysaZoSVSPXGSSf7+CR4RxjX30PNGtNXtIF4o=
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116122361cf.46.1775336692295;
        Sat, 04 Apr 2026 14:04:52 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116121971cf.46.1775336691875;
        Sat, 04 Apr 2026 14:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd8491sm2317998e87.83.2026.04.04.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:50 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:04:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
Message-ID: <mall6aengyapawa5gpkel4wuswhq3c32wf2v3sdp7m2msh3zxt@2tpezkny3my2>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX6pXZbSI1WvmV
 yayzY26BtdpLhrWnXC8UOP+NmT/FtVkbl5vGbn58UHyEpqG/Hc4KYJjyD9KZDZPmNTracVNU6Ay
 vxORyflpeYMIdxdT50Opqx2NnEtQAbhX4/bq6vcSJBCNrC3TGkuj0eshLhifwl1HCzQyePT70yx
 QzCCXSeiPu73PdiC/mX+rKfwaavhvQiietQ3NtQFeH/OA4Q6Htx10GZEi7nPZU9x+7qExCEqvYc
 l11SsGhX7qoEnaarQgGrf1lMrDXBe3p9GfX9pnRlwhTGN1ZFIJCdsqkx3C6W7RWo4z5DEiSTcA0
 vtLRQsOXYTHnNe6/41GzLOnOTdZaRoGCtZpY4g8LHlY1YUi9Wx3VCKunkCbFV57sJGlguawSotS
 60UHL6G6Lj3T/ScdDyu3glGq34hfGZfpMQCfOUnCAVYwwkP0ZtIzJHxt3vA9o+ElE+QRuQZRarH
 yMDkZXqusJ8fibSVh2A==
X-Proofpoint-ORIG-GUID: qmtQArmy3iW1L9AYMMkcIEZ37e1Yezdv
X-Proofpoint-GUID: qmtQArmy3iW1L9AYMMkcIEZ37e1Yezdv
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d17cf5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jzbMb8GUTuS7xUAGJTsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:49PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
