Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ADE3E0C68
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165402; cv=none; b=WFu9tQgNzLE0CAfqGOQAxr49qrh3gwjSfqJz/QubTYA3q62B331Xi37RzvRmjRp02kYprCS+RL5qRBi03UbzUkCVZtIbiOlNsruVG0AJQA5un8u34wpWUbeFm8gaesvmoNHd+6rzG2Q1ByK0ccQlgUJm8DRsarwVLS/Z0DLnZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165402; c=relaxed/simple;
	bh=X1PkckIN8HFBzuUJHXpj0gyUsnyjgXDoDkesNRi0/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtxrGv3lzIvEzXLExrzR/sHka5pVFHTxrkEv05Z/Ooc580T70dJnMP1H1Yv5U0i+y3GWzZiAaESDA1as8xbpK6CiX8Gsudg7nDhagGDZNJ6lG5F9Q6RCqNiTGOo6QE1rWtQhavL25XAor0a7x26n2tZbK9c1bKehgZdgdlKF1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZGcdVqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQjy3I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZGcdVqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQjy3I2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsWF1844159
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fbuWbLjGe/VWQ+xdqB2iUkT
	CTTMr+XlvxmuKcx6U5M=; b=gZGcdVqdYCsO0VsFhHqCd0VhhrMbdCkRyY8TWLBh
	++VTxnmO3iIyUqjlP+B5/cerum7HIrjv9zP2HnfE5RQcsL8+LrCYHssf0erBBe/6
	yPg59MOQU59CgT4vl0EEiovk/n/fFF+gdJxID8bQsejPRjdSjINxlmAmJxtHLPWW
	/8P4HVTAJ8B63M9yalng1HACNhguQUK0ztg+wLegIVhldcEeqIBawQHPr0PqWDr8
	vdFbq+S7hV0hoBsxlV2fo+/JOCHOjDSKcBJmBZRR90khIBOrxrlFka4Y7Uojcwk1
	KIENC3EhKg/VrR+iw7xbVtkbED6OI87al+tzt8Vp4zgJTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgw9ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so489078085a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165390; x=1788770190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=cGQjy3I29jVjxsiilLkPcd4Rf4y3yq52fNxmHfnQxHgCfa6RIFJNxa7R5yiPAONTEM
         JnsPlolUdsP2ks1MqgKzKY5qUidc6Cwuh1dITv5NbohMnbtQG2h7sxxusZ1VIrJIga7E
         7G1yM5AyQuCr7FyWXsrfBLE4QECt5o3h1gHpNUlKWE32siiKRn9m4hb++clCUtIsUyxF
         ohKIbBT987LvIzmbMVSq+dYNfXIiR0PDvExzq0Nc5PvYMX+gAqbGRUAG69BN36ghfA5F
         DCO5OIQaBIQb8p7jzwUyk0SNbiegZpQsEgFXWLkf96z6RGczT/PRVOz7IgWFjl6Lf9bN
         WZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165390; x=1788770190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=HO0YbIqC7SlZCuOYwmqrXt0zuqKJyDxmnNiBSbrY5xEbgk8CobhrqawZpKK20hBOy2
         J6aQHqrI7PeXzZ7A2fhl7cArE7cOCYuXxZXjcLThZosMSkKJ6Kn2GrCArs9H+zgBVUcN
         Ukzn62/xpDXNA6VWWuYmKOTeH98x+MM0TKP1CGZJCQdhPB5AYwT/SL+YUrLIzYt/guV0
         tlk3zn0cwmy8u2r3HZHJzRQCTC8bWPWDIu/ouZuqZqMiYlWZi2shvCeJ+V6VII4hDoWm
         NIaJfM7zfczmSD8bmWihEori7jiZLxDKKGkiBrRRR/l3nu7tHSD++fdnFLUcXmfUBK15
         VWVw==
X-Forwarded-Encrypted: i=1; AHgh+Rru7xOAdjJFd5O7SOdYBYoS8BI+zGDSF8+apCt7Hef+jRJ00C/x7MRqGa38uYLpRvjRonVHcqIBnoge@vger.kernel.org
X-Gm-Message-State: AFuF++n84FMVodkYUAzrg/+Dd8XTZM3K3HSBeCW1zTLh8ARpOMhLMQlY
	4jHQTY5NhzZZyu6sL8CfT+lMz7QELT2w8lzswxAXzpVP1c7KSrfop/eCA1chVU3a2m2vIPfORsV
	slZw7ZA3WUTlrxRaWsarf45ZCPHvgisPW+za0shaiGVbF/OT/+peAHVv5BLGzpM6VswXtpsx7
X-Gm-Gg: AR+sD12THFMoNgL82PAc1La66/mE7uogcznIHWQdP5yb5T2PAOMfD58+cO4peWM6qhf
	VO+pko8wYLfTe0YB4kTUVUYBb1Kr52eGozuKG9Cd1ZqbUQqbpM2KX8sr4kklVNjEKBQYBTUsTGf
	QrnfunapjD0bc5jZoeJdK0AiwFQ5KV+oAg1ZscvF9k8fTV2bFaT/MRJ27396G7GayxYrlZg6UJD
	PA/Pep/m63dnN6K97xVEEYtyJX5sxx+7pbG8Lzplz1W+5OTeyqDx9F39tRZ3c5KULc2uJW7QMkm
	/WfCXFDzU4byaEc2NXSJgflJ9XpKUto0vuzsYfy6jPLd2JGV0PBPhEuPUIBc7R0jE+9KpqlZ4RP
	qweiCX0cnpq3D7w==
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690955585a.22.1788165389839;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690951585a.22.1788165389248;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843adf1377sm6448270f8f.18.2026.08.31.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <xtjpv3a5cy6nvr7gw5ln4vuwdsctz5k4f7lcmfetpre5lwia27@omde323ra5mf>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX7xslc86+ltMg
 T4wACmeU+gY2tUqwB7apdICdjLEu+d1syWACZwHycz38jB1aodoT8x4FN44uQkP35tyzhQmjgub
 qZrfnmDzkam1h1brWs79/8htwyCHpU/30UYE9+KRl7lza5B85SoU0YlgCkQ4hrGYlJxCK/32N4E
 TMh1o0trIFDnUvTInIH+YV6+9hJxb1JAJspHtvoyhLm4v35q9QPeajtVDIilyNq3pQ2upWkfdAD
 vk69iczeDONk1LCsaNrCWr97ma+AXKZCfuwBgN4nnCsjOS69zbVFBXWJpvVwoEiN9hYOlwHcqSi
 4hSELndSc2T+cDXoyedYHJbW/S2T5Wf7SJjN4qDBmEsGpGNpiOR7Kdk8ItyS8rPj+Jv+TUivZhx
 nGaIS7ja6Ja9dnee0Lkxx1e/B3D61HirVa3VsNDd1NgNEM/aADk7mLsq7e7BdQ0LyDmQwzN+EB6
 bnV4yc4XvG3YBha86hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX2qXblWAmNSnx
 B0BJPpVr3J8tNiEaOr4b8SoPBEh1UBNSlNpbRZX0JDQrZIz0WJbj6Pk43dc4xgwbUi00D5QtBlN
 OLjsqN0IlfTOlErkmvpGoaBCre5h09A=
X-Proofpoint-ORIG-GUID: 2saYG6-PGyiVzKzyTm1NcvaNqolvhzS5
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953d0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Twdo5_02SbyOhDGnJGIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2saYG6-PGyiVzKzyTm1NcvaNqolvhzS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310073

On 26-08-31 10:20:52, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
