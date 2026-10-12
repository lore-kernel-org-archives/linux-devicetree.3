Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34994908B3
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818525; cv=none; b=NooXWj28copnBSHA1stdaZ+//+cODXM696C7J4xXtGILtWY/9Xa3XDRyl1hXGnzvSGhmoxpIipEbuF3xuvsu7iHdblEKMOlNsSXZj703Axr2eIhafgvRmLhTWY9WV6mEmbqa+S71/62/FmsVY5v+tW+GC1qk1jX4gWn0nrMtLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818525; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sckxK0tGIh2dM/ZajraUThgFjkMMZdv3JEONGl/xHurpRB4RPmrDwNIhfUQMshCC0A7MyoYxkNPrFYS5+1aev/6sbZregr5kcuUj6VXyIgguaK0DQKlGUH7JoJKFI8ptOL1rQw80Rl+2i0L+H+6wI4CQjI8rUS7EktIF/oxFnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwAFGcaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kN5pZUG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwAFGcaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kN5pZUG8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Aq02275878
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ZwAFGcaqM1+iBCaF
	IxVzf3en5XwQtItp9dTo9JO6FXcwWFs3dMXTHgA0ZrPcYzOLl92+hwzlcX8WP2UO
	r3vO6xX2fcpRL3aV5/1K02qX0OzZRlS1vdX0l8VTnXo36EDBPSX/Bc3sU/Q2yuW6
	C8yITBFhAbJSzCQzx+YhqPeWoDYIHeKCT8lW3GmXSR+l9qQUjHDyFcgP0/hvwoRc
	xCTP9l4z4fZnRIndmd/3C4W0h22UynMcpBC2valzU7ir7idjB98yE0n6Y1Sos6e7
	QibqHaIosFMeHm1GWJQGwRUgW8ftUW14rOihZbSwK/rqdfEoz9Biebk0PT2/6fd3
	99n5Yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so7612631cf.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818523; x=1792423323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=kN5pZUG8awedKrkSD8MgmmVbuGRhgOUQtx2+0VvzzAB5ceQ5hadIU2mVg75Xe4f4WP
         EaU9xW0f010Q/PaswcSqfM2+FTkOL5RuMqpffvCUAMW6/6CaJRtDk5Nk5zO/gMfuhZ4Y
         gYvuVJ84/+uNgtUxP4lVxtdinkBI18LTuPbilQ8XsZ5IoUDOk3qSuv4Cv79cDxqYDI/w
         sYUXGWs5pvBg7o2F+ap/6yjOHzlMv0keYG8XrtTOaOg5DeRITaN3PmIwxVUwYxejlWXR
         lmVTsGlLoDUnyLRPzAhiudwTf+piNyPZTUWof7t+r9SURTIEHnQ8eTfXNCiOYL+bjTh1
         6DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818523; x=1792423323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=hZ3ES9XaDI9qKXn8fXeygFdcM9N7TBkuKW435tfgzFe5BjZKbQ4nb3nOosXVKAuFVc
         hnmwv5Aj/M0Oc+fVj0z8uQ/Z6Rxkah9VSUCeM4sIOqFUdUtedq2wKK6PNrYhICzVcopf
         eA9cpH8PF981XSeLtKg+WgAB/5UMRWja2xpLoo/Y5zviS4SlXQriXblRaZtMOqiRckix
         K/U2SvT+WMAiSzovzhsUAqcgTJ66sRNaLYuNH5UzjcZI+TgPfgtHMh1sHhVTqz0hfRIE
         MJ5432xe7UeCQDj1po6se9esnWxeiPrX0ISgaNofJgcfWyjXC9/t6iY/b4H6ghIAMsPB
         doOg==
X-Forwarded-Encrypted: i=1; AKwUvBxzTxmb80VUitjMZIoeU4d51MELj+UjvAaDK4YsSgfr7JuhKvVHII7oE+iyBcgkDWafvwyoPDfgTmD4@vger.kernel.org
X-Gm-Message-State: AFq9FYKdzT2I3CNATiaolZIBbgYpcDUCaVaqo2yCBDsYtbeGLge2ZnEH
	cazNN0n8OQT4KGnz4wPI8u5I58LyOYW+aLqshDMevzZjcQuhHqF9ou8QPLLRb4LKoVBiQxVGfAl
	t6HiBK8eHXpyUAisoUjYLa4PyIVVEZ9zcaZpXaKPIoup56Nb3NVqZ7q0egIwonBQj
X-Gm-Gg: AYBFou30ttbgF1T9Ssi0Q/bGfTMXY3E4KhD6C9tUVizuDoeJ0VjR3zAIEwToeI/xLj3
	uaAIZ9Nwm+riTvQHP5AfN8bHXrImsGQYBm/TOZctTCD60UWJrLtPYTVhOUvBD8UWkCa3adfmnnL
	b2KcZnapy6ayQmwbq6nrg9vC7jpZMHPpcY/MpnjmdW14pXEQgvT9n2cn55eM0tSttlgT6aK5w7a
	8Deg+W9i40rfe3ayzXIb/TmQAAPFEppIGTBukw9kJr2KA2Wk4eDSHvz+IzM1qglqDM4NaV1PCDX
	jQMpxHK0sC1bq8wLitRZlY4KV77jmYUX9yPnRyIZqF2n6e3vpj2/+2usP1c5gTqAUOBjcpJFVKs
	xiePpnzLJqkr+kZfzVoxU+A==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690363485a.0.1791818522969;
        Mon, 12 Oct 2026 08:22:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690348885a.0.1791818521086;
        Mon, 12 Oct 2026 08:22:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1435990a12.27.2026.10.12.08.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:00 -0700 (PDT)
Message-ID: <0f7023b6-4fc1-48be-aa70-9564c0e1fc7e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:21:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/38] arm: dts: qcom: pm8841: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfb1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXy+uDzOkHAhaP
 OszSeC1jxBNWwjSiohr+8yj0tFujU5UXimUMlXyPNtyQcsh0eTh01vYqJ7CH8mYQEQf8pDuY8Cx
 ii3q5FLblsk7ImkXlgS7FeKdVcIja5c=
X-Proofpoint-GUID: FF0eJ7VtPH3YxspKRfdo8uWSLQhFqQmi
X-Proofpoint-ORIG-GUID: FF0eJ7VtPH3YxspKRfdo8uWSLQhFqQmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwQRkgsA3yMuT
 ma2fH6ahrhxEMBitV0yjeIKF6JEDstS0h0zFBpD9T8xBPaXuH41ngbe0eGCLsKO3p/qbZsNDkAC
 1bXyyKyfh3YvlHdq37W59gv9R+aRA9XJZI3Ph+6+pUsiQ4dGxXFiKhvCLLUgwmtUt5BMlUpU0SC
 LHieaqswVwttOv90UPgGYARLd8ZJpp0MAxIIG0Bc3Waqz7srU7tEvmNnbjKQsJaSSFpFKh0j7A8
 D2L5aX/tGfNOqjFyfoWjVQheqlg6SeR06rdTRJ/EpvCsQFYX8H6k6mMb0wv9JFXzs4DYfnIx9Cv
 IoOOjPbcp/6u6uEdKEFwS3d2Q0mM+aK52jVk2ZVLhmo/XIxYzms//9WbD5KNGdI1grymApfxh7t
 DjFBzhuTjOgF+TShw97AKOvffrt7FKWBbvyLv6oB6rfE2xwXehOQ89YYNoQpiaAJHJEPuwlIbWu
 ptoTDBR/YJjD7h/zY3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
