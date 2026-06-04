Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BC47B435
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580459; cv=none; b=QTbMnfpFqbyYkQUXcjEF/TZC4l0c/x7FyDhK5jDDU7liJ/Z2PY+/Xw74U0W7APpbeHhE80WtBFq+uojjdxiPiZ5HybM+InyfmUE7eBXqDIU8NrmLjvGlMjlFrbbXWFCqiiqIgP5WFT0hbDeZTPtC19pZXx9U9roE9TBIaJTv96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580459; c=relaxed/simple;
	bh=quBVvb2w/+UeEv8xEzFTwWL9UUha74VGxSG5qfpE5so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEd9qfTEFtpBO6/4V+Bv+2VRrsrALL/vtgOS8QUIXXUSpCO3Mq81mKP0vFXgzjhgqEzWp3oaNa3MrDaQv/zdiBrbaFjwCfMl+WZRK9wHZo3G7alLLiyLpqFjsQ2lZ86wv+joTCLEfLCsel39VD2nW6whA0BZmvZEDi2cJYyHhUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcgNgSMd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSuc6LPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcgNgSMd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSuc6LPg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548DlEQ599320
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 13:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMSSOk9m2Wl04LyAsEWMrBFk
	eOKrvo/jDJnE41Px/X4=; b=NcgNgSMdQfeNpPoJuFUiafKc2FZ3uiR6QQyQfcFC
	bQlLrWjGuu4V2bQZpFzZn2QdaTsc70V5U/aerfMlcXNDdj7hWVIoSiZdZNL0Rbgd
	vlbsc47zNt9Ft9VRnYrbsBw+RjT3W89s18xoDvlTPC7i1TxCSF1sztj9jLeNsiD6
	/cEVHA615T7Q9gX/foiuEl0cthNTtmY9FIS7jNadFZ9oP1kfIDqFgxJN5ThEGzf5
	d+bHpHkY8mB3dFgW3wzX+umX5wYPmGhCb0gLhbbtMiMfAWr52zxJ/M5PJohQtthW
	z4RQd/DP4pIQkBYzDya51WyVbrnySGZUpTDrLy14WOO9Ww==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m2k97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:40:57 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963c4721732so200870241.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780580456; x=1781185256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMSSOk9m2Wl04LyAsEWMrBFkeOKrvo/jDJnE41Px/X4=;
        b=MSuc6LPgtXHNpSlWiMEb4JOuM4nM1rhOarO+5tgQj3t31aKUWPSxBVLfGE1BQ3NPpO
         k9lBxlqDrDncCcv/ez5gurb9ck77sCP70ksbJYQK3MxzZo7uDMaFecuTxksV+bIAfUZt
         3mk98LB2COzej+lT4HOMgo6Swo8b5coChmtE5FmTIVcE9TkCfA/2iJU8ECtxHKYW2Jtk
         yx95TAr0btYFppGEwp0D750gsU79K/BgvMWam6ow9WDrymZ6FW1DmBuPUBYnQN0aFGAN
         Zobr7fos5yS9VdLRmHEoWN7qsJHQqKmb9TRRkZZMxHXdoa2YhmKqF+MDjBLwnngn7i3Q
         x36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580456; x=1781185256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMSSOk9m2Wl04LyAsEWMrBFkeOKrvo/jDJnE41Px/X4=;
        b=sUZAvgho2njMIC1mWcEp+meAjmomclqWXokJWVugDxgW9YKX0CH4gKS4TE31To1AKM
         uBpgUj8VxvZUiBAVGuRBCOHeao87RJzkcD9GB9Ucg6bWNYf3TB1x1EdRcFbXusDcVOgj
         PRq1cMzGbrCUpQ9rOoGjNKdv+QHZXqeFFwztBfjAavTOn3GM6uibDPtjqgeeF315+hGG
         Y4JDYOyaC6sEGyCN2ZMzfwHX7Yt5NMysUk7nSEuSrdDUS4LJqncGN2c1r1B4pSksWA4v
         b3eFPhfTKI7qZ619G7zsfujmcmNmZy3PuE8sFUj5YVNmqbCGUzwkjRvfjuDCZmslXiFq
         avOg==
X-Forwarded-Encrypted: i=1; AFNElJ9dXvZepLpaBJa0uthh7YxjuhhgG+7qC72nOexONpr3Pcg1+qIYO+7rFg4Z9HAbmcjuL+pway8XoCdm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7dRlwHAQitxUvtajFyQKB2AkFc/xaRi944kIMqCyucP+OMe4
	l06Fi839CvPKsnm5lMgv32IbwSq+YsglqKfo26TMHyZJz9lGDfo+LpNh++LdCSYyfjordBv/IzY
	TA2D6gceZMz9ldcD0zw7JlSAnVgavWAc5fSSUfDdFlhfZz1r4xp+DS22/qla+rUdH
X-Gm-Gg: Acq92OHDphg6m4Uk/8HKVdv0KdZkme7oDVLDMwmjOI4xyQxrb9voW7ulFP7982W+t0I
	8uukiUHu6Zq/ccEJ7BcVzWSXXkLjRn3gVTzGPMv0NAXISRk5fSC0Isq+CHoKj5vCy4g1H9oSWzg
	wygqVdbPfczq++hD+gTl2TkjRcjbpMKCXKPOk4kpqZhxM/B3Av0k2pVe0kHp4eMJ9svP6A16HPa
	umS9i6ZOgpwLLJr2RiY5xeZfKDuaS1q7Ns2mQUHT347vlmnwMraTK7ad6wH9q0LvgLBXqOjq3v8
	Hq93kqRaAMcQH702I62/0lLDISXtzrgRI9/CNTwyqm+YxFBhwyETJHNEypGup4LvoiodXMDWX3B
	4q7CtYxZQ3OxM4V3E3kRJAmxfcv8zqBENn45dADLBeY3zla7jm22ofJX+ObLTC+D/74ceLf+WhT
	49/wg/gWcAi5yFbfAXBD0wQ896i3cm9CFEAQ30XGUoGWbFKQ==
X-Received: by 2002:a05:6102:3910:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-6ec28b175b3mr4344023137.1.1780580456148;
        Thu, 04 Jun 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:608:94e3:bd89 with SMTP id ada2fe7eead31-6ec28b175b3mr4344009137.1.1780580455735;
        Thu, 04 Jun 2026 06:40:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm1228864e87.71.2026.06.04.06.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:40:54 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Message-ID: <d2s6nvknjlmwhnfoizhnafbjzgwofnqbg7pcyoeit7hbznes7s@pijbxqls4sc4>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a218069 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RNZNEj0NQT9gpfWmR7IA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMiBTYWx0ZWRfX7bGmCM078T9C
 JN+q2T4wUB6kftlb+BjyroR4yMKAIBla7qv3iefUG1D3O1/L+UuT7bS7Q0L3Rq1l/bP8mmSl2eY
 RWS0zad7pVy0x+yQzZQa21tX6ENt+TypnQYewKUb4QbwYKEkmYcISFzusW7klSKIWJFsBIKlQfm
 Tf9T+YWwLEl7RXbvr9MxehoZdNyue8CjhDK1PMT8saqoJKVOGJs52p1bL7+SJ1VB/98MlsXwup0
 529f3aY6tEFVlStsZ1ptH7EyzDZB90qmcYWeM0HehvLdGevTu/rIz7R6n2YZKFh0ogh6ebsgvcl
 OHQn1f1H3eErJHH8tUHlnv/uvIagb07r55IjbTwVHa3WsanrJmw49gdnJwcByesN/C0xaQEbqkQ
 C2/aN058BlVFlU0RaDUr+hiiRL6pXYQr4ub5LXt6a8BhO7Lc4+xzDI5HWG58w3+HOXz7FgQJDwT
 SVIo3MN7GwSZ4HsBQIA==
X-Proofpoint-GUID: D7_lO78ZZka1qsoR0omTLQCn9D5GTdE-
X-Proofpoint-ORIG-GUID: D7_lO78ZZka1qsoR0omTLQCn9D5GTdE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040132

On Thu, Jun 04, 2026 at 10:06:57AM +0200, Konrad Dybcio wrote:
> Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
> as there seem to be no issues with the firmware that would mandate
> disabling it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
