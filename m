Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493682;
	b=OrFkfAeHtjy8i81MPpP50bJQfzHJeZMjru9fmAnKfHXqSmYeHnap9xzIIqjCu+dqLiAI
	 CqiSRPtniH30Dh6OiyTTCm/4UyeFN+wYrtlm1lspOh3iGQey8+bcKD2oPMQJzRiU79UPQ
	 xwSGzq51hY8+4YrsRWkwmGq5jlaw9ojw49YYB2CACq15uE06obX1lx65CqUu6sjU75eHc
	 RSyKWUbzA+mQZJ3rvFz77Z2gGOi0OgG2HBUdhvB0ZfSJUxujnUiMH+mEV7sjvZLNcj/md
	 Y5Uv3gIvIX2tS0dxBN4oFr+JR2xFGFlpxgfLD9EppwhAayGh2kqL74yQY/cZEN87UqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
	b=HCFckxGRFzOzdGzCZ71Fr9yESliihMZcXpN4EpzQNLK92eQB5ElwLPzSBeV5k1xmzpU/
	 iFTFdh5dmBoYtgFNADEyLFElHbaobkWkyB+utEaQgQ8bLRZaqto8lyj6twQ/JM6ePlMBj
	 XNJc9QDck/otxOqoFc0pGeVGyoxYVNJlymkyUcqtdq97VgVnVYt9AeaN+sXvjaNNAU41z
	 mjqhZPWCmjBQydKG/Vc6ATzdVTF0Czgh8fqzYs7YXVIADuJ63cEk4zPma0KXCPbhlywxB
	 y/mz1KzIWJp7ULEBggnX3WRoLKGaTX74asnRYJ64ot8PG7Sc50gvJ4aStKiAD2IC1Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MCs/I5Iv";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B300606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B300606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCs/I5Iv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAk0Sa1421576
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=; b=js1DapgZNnp7iKP8
	5ih505rejGgluNIme8rnZqZkDMhMxxe/Wo4KbxT1/vBmQAAYqE7ZMQmGXt3wQ7XG
	kWBjSv53TWE4GGkrZQPcWYcPZVTgdBcTqyTKyQA8k8OEXkjWj/ksws3nkULqAnPd
	tS9E9gSDdWVOAsuqfRkEH3hgHYmTDjuXqhuENmrA+Jfno4ZUH13rPyDWoiyKmFQ0
	6ccMgPEfuGK5qprGAkJXfGVXcv3EQoJFFhBJHufKIe0Uj9olhG1fSwInSd2HWzbj
	ZwHz99OJ3JMIykgfB+H0iH+xELHT8FYFv2KcpjfXxeXXdYoVFg1wbCpUz6i+QWRv
	/VGMew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n253n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:54:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9bc964so8778666d6.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493680; x=1793098480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=MCs/I5Ivev338Be6vOmD2yPUz91tjvbk+SU1toZXUSVdR7fkRsA6+a78Sf4ujR0osJ
         zCvLcIKVFZvlT+fV31R9ZqmreAa44QQvJzRNUvMcKYSfuwKpXotohBqIpKBQfEaVUJm1
         zl68yNiVDUHikhmmSVpnNWEVT2i5N+m0FLSONCadrOqbzf4n3sEbbA7OHxblmYWPqioj
         MOq/ob4bTQ9bOLxADRL/TXaf4iTF6vcWYMl/WjL5Y+O9XWs2hn9u0WIElSCjab10ObeF
         19UG0uEfDueV6qXV6rRrA9Poith8je2Fo2GjReIgj4hLNPkaL5KX1mdkxSM5Y+u/S+X/
         vY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493680; x=1793098480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=TAO6/P7yXPOiafDyLFa216KhpD/1zuNaqp9lA/tcRYe8JSFQHu2vGYvYNRxJWpSe43
         23HXY27aKSz2u4XMsnhmV9G1QVWOvVfsFFKEHSjJy1PEwsPPxrYCDZ88dLjzly29IWPi
         IIiD+/QA8n6jNaM7bQ5HAST4Owe8Qng8bvYJIkt4ENVQ5eiJzzQfU+J2tfSzgYWWMa4F
         PTpseD+25vOMbvDOy9ekntkeB8HM2DmqO0hfxIX9lju759emWwj0Nsq9wVEVKiPPOqtp
         P4xRbNyGN+oLTfh5C3K1G3P0VKGVQV9/6Q08LBRAQ97rfUmQ12ddsdxnVYFYZ3vSOiOU
         qPmg==
X-Forwarded-Encrypted: i=1; AKwUvBy4wA9r9n4RWKHqbwUZn0qKV5BY6cpdKGingVOhJsz7q+PBwcb1GnjVCgluF3rTosWRyoiFhygL7EX/@vger.kernel.org
X-Gm-Message-State: AFq9FYIJSukEJccbQ+sz62T/A7eeyIexQzO0vfEw8v++AtVyfM6jA13d
	yW8c+MvWar+Lqt7eQLgdk8gyo4As2yn+iwIhxg1ymZx1O2MQRwPW0DnSjFa5RENzwHKb/HrH8tq
	zvo0ZkdwFSJiPztcRaalmfjREhmgGam/05th930dweaARsXjniGzyYg3URaCymLqX
X-Gm-Gg: AYBFou1AN8WMjLSRE7n6Hzf0a7ly5q1C3tHqfjloEUcpnS48bofmzV3MbUDSf2cK4aS
	lGIv6iPSETdJFfXvyAduf60DT2jK6HUhpOEmD+7Vuf9+bYIcW9vLUZ/jSZR1QNYsZZ307YekJh3
	iS6VNiVvp1RrQiTDrdfjZPIIOq4kPPeHVF/r/ZPA8kGlkTZ3AdwcgYaE1uHsSjHAdFBpqCDXcsa
	kLbjT8sDUC4xOF5VCoJXxUcBlgxI0JQvglmtrWWLEB8yRCEUkdMcjELXRJlWaxesWZONZ8p7xIS
	s6tPRCUG3xaEbC+q2zjFUF3mHj22/6tGmglzpW8095ilcLjyQCIoLW9r8e8oK8RglUqufCXTz26
	R8wPa4wfh1EOnyVt6DsOMtQ==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8060961cf.3.1792493679893;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8060801cf.3.1792493679378;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm465672066b.75.2026.10.20.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:54:38 -0700 (PDT)
Message-ID: <a0098b0b-85d8-4da2-b41b-7e9e73bc70de@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:54:36 +0200
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
Subject: Re: [PATCH v6 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dEXn85xjhsqV9dzj3NGdzz9VVSs-PeQv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX7/LTx51tYMHh
 Gy/a7UsCx12L9d/J8Np71OxUOkl+gMxHdKUxGI2RL3Z0c0AMVSk2uGMMqf/cfWAp2XR/kOdpWSW
 VPLBrZp9gr/EV8ZABbe+YJEUgyjSXBg=
X-Proofpoint-ORIG-GUID: dEXn85xjhsqV9dzj3NGdzz9VVSs-PeQv
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad74870 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vWphLq9OX84qfFS8ZdsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX3hxp48MzTyPw
 19iZ2lF8CcGw/x0uUgWUdCPu04UyRcXyutx7guEM7VG2DsXcYE9qI3NpSrroNhWhDiz7l0JOzBN
 A20A6ce7Xq2t6enFXgkrR73OwlnnXMJVAY+y2cfmaAYDNHGniRX4Kh/quiYgA5AGpDmOrDUEOBO
 Ye6Q/BW5iA8k6b/7jiVmDkIDxMxmvPqqv6nZ/rESJ4knelQ9/CFbk9vBv0G69tFnJcjKEYolm6T
 QXsZSW6qsLpLQFenFABWQ3/i3zicX+YrinOJI0a/M9qLPvwEICVTnBOw/N8ZrUY+NIVbqjXd6vV
 8h497X/rGqQnwsXZLfIzI+e5wFj+OMbEg07iqougRUVdwpI/UbenexyIa3Bq3J/IbRWuylieq7b
 QXJLBaEvkd74kLsyPVQIB297YjzWABeGdRhr3VgvVWal//wQdp289ISLTi+vjFBQG3pue2ZdM9O
 W5BN/91AFQAmBR5FTaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:50 AM, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
