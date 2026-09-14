Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCF40EB90
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375102; cv=none; b=D3PAkGV5ndPukd2fO7a2CI94XuvLabBtDfcS9SHoxzdr1uW/k03zMxMRHXVLP8F2kLl+Roow9VZQbp4Y2wPDBvDN7P/REPui2zVkchPgEQqvoUIpwEeWeKCIgMNc6kCAjr47bGDx5owEdqLizK+9Z30i9UHAtDAOG+V5bsf2eds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375102; c=relaxed/simple;
	bh=gHKHSOLSzp3WyOusQFfkD5ITajAvimdGQIbANCYNGQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdEIEZqvWPBvGTvfIbFTfyBlWE/Y9+b8TUJC5WDR3ny/PwUIXMYhYOBYLWnCZpFLn0X6CFvoTuxYiXc/F1nad2HdeGvO6jiTRkHrtE/7slGrApEih4T7zJTlbUtJHbVXejchiWiPsxG9OvkjLV8LTMfKUFvZMdjgXOSx5cdU9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Vl5ae/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gi9OszNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Vl5ae/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gi9OszNh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5imVB793401
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=; b=V+Vl5ae/XfXG1uxI
	GSoAD8q1+fyk9uGG9BQWaCJnAs1MFZdd40SKwbTSsK6D49aBU7YEl7idCB79Nqtc
	Waj0A+wlp8fCzdiKsJPQevRijL4OOFS87MuF8jzvxSrqC74Q6xF7xC3POZ3AmvI3
	5dEq0zaQTng82S4+rCyI/AdjQFfaT6A1fGIDCJtOmPlmI6Cp0kSSrqe63WHGnFn2
	m82Cj244OANgRelnNPHe0tyA3u6SfcFY0V9llSj72R3enK/tWYUeVgSPtumcM8kT
	2qW2YHsZkoJNrJIaDFoxvPsHjkxBaFMYfmrLn1cUImNyjkfORnYPmrCqDlSyiDsU
	J24MpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnr1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:38:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso605467885a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375093; x=1789979893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=Gi9OszNhpqSoOXwdX203sybTt461XS5kmAhbk5g2aDWzs3+4VzYsQ9nKUb4TAC3yY9
         DMYKE/ilVj4GDEr0hpr8GLGDxTqVxbPMxGdasWh4/SxwGCFDMP9y1B2CaN4gp54J6yFK
         QFls75WRf6IajxT3c9fgn9BghWaFEsHoUitRmCO/95zMl3r8PCbFYTZ+6fSptr1oc+LO
         5NvxXwRYIFqpnztlWHxjSIFR4h/t24W/X2c5FNf2M346Cg/du6OdY38EHWf/RX8L6x9w
         FSCkl888mLGqgw6BQUcc8vZOrb0bl3uXLIAfhkANjYW6pK0LLiKVfN8ulpqDOL19lY9G
         dGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375093; x=1789979893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=Yo+L7uUPuP1tpXoS6en/m3LZyUvU0qFdvPtErNugaawa+CwXdn5IR2Swa7vDDOEbjf
         4CPKe7pacpKzu0wmt8MEJq4wubqmSRzE97KBkYlc2hEkCpWDxFYZBdeIr2J/SjKHWy3m
         X/2RgwKKi69MMUxefgOZTWK6ANkLKJYMWQbs105BlK785h3eOgjz8yEZyGzrSiDZJ5s2
         MZ1O4SO3nqO+HjqfRXxJlGNS1i6ASWWgHnlw7pUPfuWbVD+ia2o1/PQg+8JliaHEGy7L
         wYj2z68DHILZhDDQaPWDCX3xPFV6+DoCh0jjlEA/M9bFAKD8tKZ0K4M7+rJNHwPNG6Qb
         Oy9w==
X-Forwarded-Encrypted: i=1; AKwUvBzpP11hiLhb/BWgZhsmG/G6wQYGIL6VXAROopQWIJHODKpAmq5zedx/3FWWpMcjGGQ6SjQ5WTKgP0QJ@vger.kernel.org
X-Gm-Message-State: AFuF++kBMEsTt9uhXh7p7QL+tdEfM6BOK/zy5aUPX1VmC8G1CBgAkSgQ
	1oIUqST5q6MTkaWHdp3URShRPOTqoxGCEhxv6HulrAFPF+w1XwqkH7KoKAhnf5alFNKEVl76noo
	dMQLqhSYxve+HDbu/acfqoVXMQY4X6pG4LB7mnf6ZoEbLHLbbIklFd7l8wJ96apQ4
X-Gm-Gg: AYBFou0dYTIV5T3Z0u7yt2UToqSiAQ5z0PP6JCsa5VW0aRW7uL06UpORBeXDrmGJtvF
	3LVmFbvJD1QMXZ+g7cjooYrIt7vOGImb36iiyq2dB94pyYZOLGCqmj8A0PeM67kxJpKVgxPJtKp
	rrBalILj1QR4AQTMO+reDjjzYFvh55FQzThKXyfY6PWR0iVrYJriZEbAoHgCkfITpc9Nv9aqq/1
	1F9cgNdjH+owLkBmMGJ+td03GNCcKeJIo1FwHGHg3g8++F6XyUdXrJyc536J1IMhb4QaEMxdwio
	TI7YKIzooJAtWYKrZgKsunhxo835Sm+wXy2XTQGdIo5nMAui9hP7pWo82g+s18adqpqZYR6TnYP
	+NbC6NqCKhPypwbyQn0y2Bw0e+h4=
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205658885a.31.1789375092931;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205655685a.31.1789375092381;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23425466f8f.30.2026.09.14.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:38:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] gpio: realtek-otto: add pinctrl support
Date: Mon, 14 Sep 2026 10:38:08 +0200
Message-ID: <178937508534.32495.18371049241365585630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787830440.git.misha.zavertkin@mail.ru>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX27J3yA/2qwjk
 b+XDUJTjbmdKiZbQmWm9zRVdt7QwFyh3uyI4pyMGy4KQeeNquVmCz6xFFysC+87pughAE3ZHaz2
 gBI0fb747pJGTpBCB9shDLlOOSCTUiiTdwNuB6NRmz12iulJXY5OWF43CKXGcbj788oZwG2kinL
 xUkGP7kRWX2wncZDCPnfOtOoqI06NkyEfzn2ani9MtzyW8bz4iM/ZWgqHtFP321nOiL6AE+wTqB
 pLtPBLI3ALB2+ze/3vO3OBgeupzL1SZwQEXOGkSd9NVMX1XflQhNC7zRNvHfAIrsCA5nFzyX4Lz
 igb+w0lmh2Q3ZsGJrCTSND1wzoqszNBAzpjm9RE4odPKPxJUj3MlG2HgkxMJiwvEoRcbF9bkHV1
 0O8I21VVCYXHutoc5EB9yU3UfjUGhFMJFngh+NO7QTvvFIilZxjUatu1Il0IBYSjN6R51o924D+
 6Mc2Bmcw6hrd8WgVwsQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7b27b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zBn-OFdvgJRZKxyvXKsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXysvydRUKKsaR
 9AnzUlhZeDwqkuysttAe3D6gOwtS4xbbxvKH5lBV78he0R1BxBqOPzB6WtB7MoFb7BVl3R+ubyZ
 oo0G9SC0my+11/0p1No0MBtjzlBBpsw=
X-Proofpoint-GUID: pgQ07r3iAQnhQ4SNdo38t6xxU8w0CTFA
X-Proofpoint-ORIG-GUID: pgQ07r3iAQnhQ4SNdo38t6xxU8w0CTFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121


On Thu, 27 Aug 2026 21:29:29 +0700, Michael Zavertkin wrote:
> This series adds pinctrl support for RTL9607C and referes it
> in documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
      https://git.kernel.org/brgl/c/3f860d25f7be981d78c1b85a8d4fafcd914d4df9
[2/2] gpio: realtek-otto: add pinctrl support
      https://git.kernel.org/brgl/c/7257c35db0fdb4fb02d857a8197a16afa84d92c0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
